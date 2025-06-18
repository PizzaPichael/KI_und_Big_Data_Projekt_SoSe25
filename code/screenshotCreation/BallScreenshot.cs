/* Is needed to let the script end play-mode after script is done. And so that building the
game doesnt cause any errors.
*/
#if UNITY_EDITOR
using UnityEditor;
#endif

using UnityEngine;
using System.Collections;
using System.IO;
using System;
using System.Collections.Generic;

/* Serializable ImageAnnotation object that the distance annotations are saved in.
Needs to be serializable as they need to be converted to JSON data later on using 
JsonUtility. JsonUtility can only handle serializable obejcts.
*/
[Serializable]
public class ImageAnnotation
{
    public string ImageName;
    public float Distance;
}

/* Serializeable wrapper class for ImageAnnotation objects to be able to serialize 
the ImageAnnotation List.
*/
[Serializable]
public class ImageAnnotationList
{
    public List<ImageAnnotation> annotations;
}


/* Main script part. Is a Unity-MonoBehaviour, meaning a special type of C#-class, that is
provided by Unity. Enables to add a script to a gameobject in unity-editor. Can use methodes
like Start(), Update() and Coroutines to control behaviour of unity objects.
*/
public class BallScreenshot : MonoBehaviour
{
    // Script parameters that can later be adjustet using the inspector in unity-editor
    public GameObject ball;
    public bool takeScreenshots = true;
    public int screenshotCount = 10;
    public int framesToWait = 0;
    public bool enterManualDistance = false;
    public float manualDistance = 0f;

    // Internal script parameters, not visible/editable in the editor, only used for scriptlogic
    private const float fixedX = -14.5f;
    private const float fixedY = 0.03f;
    private const float minZ = 0.5f;
    private const float maxZ = 6.5f;
    private const float minBallRotation = 0;
    private const float maxBallRotation = 360;
    private List<ImageAnnotation> annotations = new();

    /* Start methode that is being executed once on unity-scene start, if the gameobject
    the script is added to as a component is active. 
    Can be used for initialisation on scene start.
    */
    void Start()
    {
        StartCoroutine(MoveBallAndCapture());
    }

    /* Helper function to wat until the amount of frames given by frameCount have been 
    rendered. Is needed because moving the ball takes several frame rendering cycles.
    If not used, screenshots will be taken while the ball is still "moving" and the ball 
    gets blurry in the screenshot. Waits until the end of each frame rendering.
    */
    IEnumerator WaitForFrames(int frameCount)
    {
        for (int i = 0; i < frameCount; i++)
        {
            yield return new WaitForEndOfFrame();
        }
    }

    /* Main fucntion that moves the ball in the scene on script execution and captures the
    screenshots.
    */
    IEnumerator MoveBallAndCapture()
    {
        DateTime currentDateTime = DateTime.Now;
        string currentDateTimeString = currentDateTime.ToString("yyyy-MM-dd_HH-mm-ss");

        string imagesFolderPath = $"./Assets/Screenshots/{currentDateTimeString}/images";
        string distanceLabelsFolderPath = $"./Assets/Screenshots/{currentDateTimeString}/distance_labels";
        if (takeScreenshots && !Directory.Exists(imagesFolderPath))
        {
            Directory.CreateDirectory(imagesFolderPath);
            Directory.CreateDirectory(distanceLabelsFolderPath);
        }

        for (int i = 0; i < screenshotCount; i++)
        {
            float randomZ = UnityEngine.Random.Range(minZ, maxZ);
            float randomXRot = UnityEngine.Random.Range(minBallRotation, maxBallRotation);
            float randomYRot = UnityEngine.Random.Range(minBallRotation, maxBallRotation);
            float randomZRot = UnityEngine.Random.Range(minBallRotation, maxBallRotation);

            Vector3 newPosition = new(0, 0, 0);

            if (enterManualDistance)
            {
                newPosition = new(fixedX, fixedY, manualDistance);
            }
            else
            {
                newPosition = new(fixedX, fixedY, randomZ);
            }

            Vector3 newRotation = new(randomXRot, randomYRot, randomZRot);

            ball.transform.position = newPosition;
            ball.transform.eulerAngles = newRotation;

            yield return StartCoroutine(WaitForFrames(framesToWait));
            if (takeScreenshots)
            {
                string screenshotName = $"{imagesFolderPath}/{currentDateTimeString}_Screenshot_{i}.png";
                ScreenCapture.CaptureScreenshot(screenshotName);
                yield return StartCoroutine(WaitForFrames(framesToWait));

                float distanceZ = Mathf.Abs(transform.position.z - ball.transform.position.z);
                //Debug.Log($"Add annotation: {currentDateTimeString}_Screenshot_{i}.png, Dist: {distanceZ}");
                annotations.Add(new ImageAnnotation { ImageName = $"{currentDateTimeString}_Screenshot_{i}.png", Distance = distanceZ });
            }

            yield return new WaitForEndOfFrame();
        }
        //Debug.Log($"Annotations: {annotations.ToString()}");
        ImageAnnotationList wrapper = new ImageAnnotationList();
        wrapper.annotations = annotations;
        //Debug.Log($"Annotations wrapper: {wrapper.ToString()}");
        string jsonString = JsonUtility.ToJson(wrapper);
        // Edit the json string, otherwise it will have a `annotations:` key at the start. 
        int start = jsonString.IndexOf('[');
        int end = jsonString.LastIndexOf(']');
        string arrayJsonString = jsonString.Substring(start, end - start + 1);
        arrayJsonString = arrayJsonString.Replace("{", "  {")
                                         .Replace("},", "},\n")
                                         .Replace("[", "[\n")
                                         .Replace("]", "\n]");

        string jsonFileName = $"{distanceLabelsFolderPath}/annotations.json";
        //Debug.Log($"Annotation count: {annotations.Count}");
        //Debug.Log($"JSON: {arrayJsonString}");

        File.WriteAllText(jsonFileName, arrayJsonString);

        Debug.Log("Done.");

        TimeSpan startTime = currentDateTime.TimeOfDay;
        DateTime finishDate = DateTime.Now;
        TimeSpan finishTime = finishDate.TimeOfDay;

        TimeSpan timeTaken = finishTime.Subtract(startTime);
        Debug.Log($"Time taken: {timeTaken}");

        // The next few lines let the script automatically end the game mode
#if UNITY_EDITOR
        EditorApplication.isPlaying = false;
#endif
    }
}

== Datenbeschaffung: Vertiefung
=== Synthethische Daten

Synthetische Daten werden im Gegenstz zu realen Daten nicht durch beobachtungen gewonnen, sondern erzeugt. Sie werden künstlich generiert und können einen realen Datensatz entweder ersetzen (Vollsynthethisch), teilweise ersätzen (Teilsynthetisch) oder ergänzen (Hybrid). Für meinen Anwendungsfall werde ich ausschließlich künstlich generierte Daten verwenden, da es keine für diesen spezifischen Anwendungsfall bereits existierenden Daten gibt.

=== Diskussion der beiden synthetischen Ansätze
Zum Zeitpunkt dieser Arbeit habe ich zwei Ansätze zur Erzeugung der Daten in Betracht gezogen. Der erste ist die automatische Erzeugung der Daten mittels eines Bilderzeugungs Models. Der Zweite die teilweise manuelle Erzeugung der Daten mittels einer Szene in Unity. Diese Ansätze werden im folgenden Erläutert, getestete und diskutiert.

==== Image Generation
Das erzeugen künstlich generierter Bilder ist heute einfacher denn je. Viele generative Bildmodelle stehen heute im Internet zur Verfügung. Der Vorteil der generierung künstlicher Bilder durch ein generatives Bildmodel ist, das theoretisch eine große Menge an Bildern in kurzer Zeit erezugt werden kann. In meinem Fall habe ich testweise die Bildgenerierungsfunktionen der beiden Large Language Models LeChat von Mistral AI und ChatGPT von OpenAI verwendet.
LeChat verwendet zur Erzeugung von Bildern das FLUX.1 Diffusionsmodell von BlackForest Labs. ChatGPT verwendet das Diffusionsmodell DALL-E 3 von OpenAI.

===== Durchführung
Ich habe für die Erzeugung der Bilder folgenden Prompt benutzt:

"Erzeuge ein Bild eines Tennisballs auf einem Tennisplatz. Der Tennisplatz ist in einer Sporthalle. Es sollen keine Menschen auf dem Bild erkennbar sein. Das Bild soll aus ca. 20cm Höhe aufgenommen worden sein. Der Ball soll einige Meter weit von der Kamera entfernt sein. Wähle diese Entfernung beliebig. Bitte schreibe, nachdem du das Bild erzeugt hast, wie weit der Tennisballauf dem Bild wirklich von der Kamera entfernt ist."

Es wurden mit jedem Modell mehrere Bilder erzeugt, sofern das mit den kostenlos zugänglichen Versionen der beiden LLMs möglich war.
LeChat erzeugte zuverlässlich Bilder mit einem Tennisball auf einem Tannisplatz, in einer Sporthalle. Jedoch waren die Abstände des Balls zur Kamera immer die gleichen, während die Angabe der Entfernung von LeChat variierte. Zusätzlich lässt eine logische Beurteilung der größe des Balls sowie der stilistischen Art des Bildes darauf schließen, dass die Entfernungsangaben des LLMs nicht korrekt sind. Der Ball nimmt immer ungefähr ein viertel des Bildes ein und der Unschärfeeffekt suggeriert, dass es sich bei der Aufnahme um eine Nahaufnahme handeln soll. LeChat behauptet jedoch, dass die Bälle drei oder vier Meter entfernt seien sollen.

Folgend sind die Erzeugten Bilder sowie die dazugehörigen Antworten von LeChat zu sehen:

#figure(
  image("../Assets/LeChatPictures/Bild1.png", width: 70%),
  caption: [
    Beschreibung und Bildausgabe von LeChat.
  ],
)
#figure(
  image("../Assets/LeChatPictures/Bild2.png", width: 70%),
  caption: [
    Beschreibung und Bildausgabe von LeChat.
  ],
)
#figure(
  image("../Assets/LeChatPictures/Bild3.png", width: 70%),
  caption: [
    Beschreibung und Bildausgabe von LeChat.
  ],
)

===== Bewertung
Aus den erhaltenen Ergebnissen lässt sich schließen, dass generative Bildmodelle nicht dafür geeignet sind, Maßangaben entsprechend ihrer realen Gegebenheiten nachzuahmen. Insofern wird die Erzeugung der Beispieldaten auf diese Art und Weise nicht weiter in Betracht gezogen.

==== 3D Modelling
Virtuelle, dreidimensionale Umgebungen werden heute bereits vielseitig zum Training verschiedener Anwendungen eingesetzt. Beispielhaft ist hier die Robotik, in der z.B. die von NVIDIA entwickelte Simulatiosnumgebung Isaac Sim nutzt, um virtuellen Klonen ihrer Roboter Bewegungsabläufe beizubringen, die dann auf die reale Welt übetragen und in dieser genutzt werden können. Diese Simulationsumgebungen stellen ebenfalls unstrukturierte, synthetische Daten dar, anhand derer z.B. ein KI/Machine Learning Model für die Bewegung eines Roboters trainiert werden kann. Man kann virtuelle Umgebungen auch für das Erzeugen von Bilddaten verwenden, indem man eine virtuelle Szene dessen erzeugt, was man von einem Model klassifiziert oder erkannt haben möchte. In meinem Anwendungsfall wäre eine solche Szene z.B. ein virtueller Tennisplatz. Auf diesem kann dann ein Virtueller Tennisball platziert werden und ein Bild dieser Szene aufgenommen werden, welches dann für das Training eines Modells zu Erkennung der Entfernung eines Tennisballs vom Roboter genutzt werden kann. Vorteile dieser Vorgehensweise sind, dass der Prozess der Bildaufnahme und Platzierung des Balls relativ Zeit unaufwendig sind und schnell verschiedene Positionen des Balls und der Kamera eigenommen werden können. Desweiteren kann die Entfernung des Balls zum Bild genau bestimmt werden, da es in Modellierungs und Engine Software möglich ist, Objekte Maßstabgetreu einzufügen, zu platzieren und zu skalieren.

===== Durchführung

Modellierung einer Szene in Unity
Tennisplatz in einer "Halle". Halle ist ein Cube. Tennisball auf dem Tennisplatz. Plan: Mit Blender die Maße des Platzes und des Balls messen. Entsprechend sklaieren, dass beide realistische Maße haben. Tennisplatz ca. 23,77 m x 10.97 m @noauthor_abmessungen_nodate. Tennisball Durchmesser ca. 6.5 cm @valentino_durchmesser_2023. Ich habe mich für einen Durchmesser von 6.6cm entschieden was in Unity eienr Scale des Balls von 3.4 in alle Richtungen entspricht.
Die Kamera wird an einem festen Punkt platziert, in der Mitte de Platzes, direkt neben dem Netz, mit Blick vom Netz weg zum Spielfeldrand. Der Ball soll dann, in der Theorie, durch ein Script an zufälligen Stellen innerhalb des Blickfeldes der Kamera platziert werden. Dann soll das script einen Screenshot machen und die Entfernung des Balls zur Kamera berechnen. Die Entfernung des Balls wird dann in einem Textdokument gespeichert, das wie der Screenshot heißt.

Kamera:
Es wurde versucht die Einstellungen der virtuellen Kamera so realistisch wie möglich an die der evtl. später genutzten RaspBerry Pi Camera Module 3 @noauthor_camera_nodate anzupassen. Einige Einstellungen lassen sich aber nicht 1 zu 1 übernehmen. Z.B. kann das Field of View nur entweder Hotizontal oder Vertikal angepasst werden. Wobei eine Änderung des einen Wertes, den anderen mit verändert. Ich habe mich dann z.B. auf eine horizontale FOV von 66° festgelegt, da ich die breite des aufgenommenen Szenenausschnittes nicht unnötig verbreitern wollte. Entgegen der in der Doku stehenden 41° für die vertikale FOV beträgt die vertikale FOV in Unity dann ca. 34.4°.
Ein weitere Wert, der sich nicht ändern lässt, ohne die Einstellungen für die FOV zu beeinflussen ist die Focal Length. Es kann sein, dass ich die Einstellungen nicht vollends verstehe, ich wollte mich aber auch nicht zu lange mit der Kamera aufhalten. Sollte es aber nicht möglich sein, die Werte einer realen Kamera vollständig zu übernehmen, könnte das eventuell einen Einfluss auf die Leistung des Models in einer realen umgebung haben, da unterschiedliche FOV Werte Objekte unterschiedlich darstellen/verzerren, da eine Kamera mit einem größeren FOV dazu neigt, Objekte Objekte kleiner darzustellen, als mit kleineren FOV Werten.

Kamera auf der Y Achse in 20cm Höhe platziert, Annahme, dass das die Höhe der Kamera auf dem Roboter sei.
Auf der X-Achse -14.54 und -2 auf der Z-Achse.

Ball:
Der Ball soll zufällig im FOV Radius Feld der Kamera platziert werden. Die Höhe Y-Achse bleibt immer gleich auf 0.034.
Zuerst wird nur der Z-Achsen-Wert, also die Entfernung verändert. X-Achse bleibt -14.5. Der Ball befindet sich also in einer Linie mit der Kamera auf der X-Achse.


=== Versuchsaufbau des gewählten Ansatzes
=== Durchführung des gewählten Ansatzes


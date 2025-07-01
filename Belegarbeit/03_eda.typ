= Explorative Datenanalyse

Wie bereits erwähnt handelt es sich bei den hier verwendeten Daten um unstrukturierte Bilddaten. Die Anzahl der Daten beträgt so viele wie bei der Ausführung des Scripts angegebene Screenshot Counts.
Ein erster Testlauf nachdem das script zufriedenstellend funktionierte enthielt 50 Datensätze.
Datentype sind vom Typ .png.

Alle Bilder enthalten wie gewünscht eine Abbildung des Tennisballs in einer beliebeigen Entfernung zur Kamera.

Zusätzlich zu den unstrukturierten Bilddaten erhalten wir außerdem zwei Datensätze an strukturierten Daten.
Der eine in Form einer .json Datei, der andere in Form einer .csv Datei. Beide enthalten die Annotationen der Distanz für jede der Bilddateien.

Die JSON Datei enthält eine Liste an Annotationen.
Jede Annotation verfügt über den key ImageName, der den Namen der zur Annotation gehörigen Bilddatei enthält, sowie den key Distance, der die Distanz zur Kamera enthält.
Die Listeneinträge sind in der Riehenfolge angeordnet in der sie aufgenommen wurden, also von Index i = 0 bis i = n, wobei n die Anzahl der zu Scriptbeginn festgelegten Screenshots ist.
In unserem Testfall befinden sich 50 Listenobjekte in der JSON Datei.
Der key ImageName enthält ein string-value. Der key Distanz ein float-value mit mehreren Nachkommastellen.

Das gleiche liegt für die csv-Datei vor. Sier verfügt über zwei Spalten, ImageName und Distance.
Beide Spalten enthalten die selben Daten wie die JSON Datei.

Die korrektheit der Ausgegebenen Distanzen wurde mehrmals mit der eingabe Manueller Distanzen überprüft.
Die Namen der Bilddateien stimmen in beiden Fällen mit denen der entsprechenden Bilddaten überein.

Anhand des eda notebooks lässt sich erkennen dass für die Anzahl n an Bidlern je ein Datenpunk vorliegt.

Ein erster Test, die Bilder mit Yolo annotieren zu lassen verlief wenig erfolgreich.
Yolov8n kann Objekte aus bereits 80 vortrainierten Objektlklassen erkennen und annotieren.
Eine Davon ist die Sprotsball Klasse, zu der unter anderem Tennisbälle gehören.
Aus einer Menge von 50 Bildern erkannte Yolo auf keinem den Tennisball als Sportsball, wie in @statistik-weiße-linie zu sehen.

#figure(
  image("../assets/unitySetup/statistische_auswertung_weiße_linie.png", width: 70%),
  caption: [
    Statistische Auswertung der richtig, falsch und nicht erkannten Tennisbälle als Sportsball Objekt auf der weißen Linie.
  ],
)<statistik-weiße-linie>

Eine Vermutung war, dass die Platzierung des Tennisballs direkt auf der weißen Linie problematisch war, da sich der Ball nicht gut von dieser abheben konnte, siehe @ball-auf-weißer-linie.
Desweiteren ist erkennbar, dass sich ein Schatten auf der unteren Hälfte des Balles abzeichnet, dieser könnte die Erkennung des Balls auch beeinträchtigen-

#figure(image("../assets/unitySetup/2025-06-18_19-10-27_Screenshot_0.png", width: 50%), caption: [
  Beispielbild des Balls auf der weißen Linie.
])<ball-auf-weißer-linie>

Der Ball und die Kamera wurden weiter nach rechts bewegt, so, dass der Ball nun vor blauem Hintergrund lag, wie auf @ball-auf-blauem-grund zu erkennen.
Außerdem wurden die Materialien des balls mit "unlit" Farben ersetzt, sodass eine Schattenbildung auf dem Ball nicht möglich ist.

#figure(image("../assets/unitySetup/2025-07-01_16-00-41_Screenshot_0.png", width: 50%), caption: [
  Beispielbild des Balls auf der weißen Linie.
])<ball-auf-blauem-grund>

Nun erkannte Yolo bereits 23 der 50 Tennisbälle, wie in @statistik-blauer-hintergrund zu sehen.

#figure(
  image("../assets/unitySetup/statistische_auswertung_blauer_hintergrund.png", width: 70%),
  caption: [
    Statistische Auswertung der richtig, falsch und nicht erkannten Tennisbälle als Sportsball Objekt auf blauem Hintergrund.
  ],
)<statistik-blauer-hintergrund>

Aus @statistik-blauer-hintergrund ist ersichtlich, dass die Entfernung des Balles eine wichtige Rolle bei der erfolgreichen Erkennung des Balls als Sportsball spielt. Genauer scheint ab einer Entfernung des Balles von mehr als drei Meter zur Kamera die Menge an richtig erkannten Bällen auffallend gering zu werden.

Das ist nachvollziehbar wenn man berücksichtigt, dass der Ball in der Auflösung 640x640 ab einer bestimmten Entfernung nicht mehr wirklich als Ball erkennbar ist, siehe @ball-weit-entfernt.

#figure(image("../assets/unitySetup/ball_weit_entfernt.png", width: 70%), caption: [
  Hereingezoomter screenshot des Balles mit weiter Entfernung von ca. 5.83.
])<ball-weit-entfernt>

Auch bei einer höheren Anzahl an Screenshots, 200 in diesem Fall, bleibt es dabei, dass Distanzen über drei Meter dazu führen, dass der Ball nicht mehr richtig erkannt wird, siehe @zweihundert-shots.

#figure(
  image("../assets/unitySetup/statistik-zweihundert.png", width: 70%),
  caption: [
    Statistische Auswertung der richtig, falsch und nicht erkannten Tennisbälle als Sportsball Objekt auf blauem Hintergrund mit 200 Screenhots.
  ],
)<zweihundert-shots>

Hier stellt sich nun die Frage, ob es überhaupt sinnvoll ist, eine so geringe Auflösung für ein Bild zu nutzen, wenn diese verhindert Bälle auf größeren Entfernungen erkennen zu können?

Jedoch ist anzumerken, dass es sich bei diesem Versuch nicht darum handelt, bereits die Entfernung des Balles zu schätzen. Die Erkennung des Balles ist aber sehr wohl ein wichtiger Bestandteil dieser Problemstellung und wenn Bälle nur bis zu einer bestimmten Entfernung erkannt werden können, stellt das ein Problem dar, da der Roboter im echten leben im Obtimalfall auch Bälle auf der gegenüberliegenden Seite des Platzes erkennen und ansteuern können soll.

Kurzfristig ergeben sich nun zwei Lösungsmöglichkeiten:
1. Die Auflösung der Bilder anheben, z.B. auf 1208 x 1208. Das würde die Rechenzeit anheben aber Bälle auf weiter entfernten Distanzen eventuell besser sichtbar machen.
2. Die Platzierung der Bälle auf ein Maximum von drei Metern beschränken.

Da die Frage dieser Arbeit ist, ob es möglich ist Distanzen mittels eines NN aus einem zweidimensionalen Bild heraus zu schätzen, werde ich mich für die zweite Möglichkeit entscheiden.
Dafür werde ich das Script so anpassen, dass eine maximale Entfernung der Ballplatzierung von der Kamera als Parameter eingegeben werden kann.



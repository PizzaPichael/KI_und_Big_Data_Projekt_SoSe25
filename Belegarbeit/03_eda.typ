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

Es fehlen keine Daten.
Die korrektheit der Ausgegebenen Distanzen wurde mehrmals mit der eingabe Manueller Distanzen überprüft.
Die Namen der Bilddateien stimmen in beiden Fällen mit denen der entsprechenden Bilddaten überein.

**TBD EDA IN JUPYTER DURCHFÜHREN**

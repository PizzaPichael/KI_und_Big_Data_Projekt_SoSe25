= Einführung

Die vorliegende Belegarbeit befasst sich mit dem Thema der Positionserkennung mittels Machine Learning. Genauer soll es darum gehen dreidimensionale Positionsdaten aus zweidimensionalen Daten zu bestimmen. Diese zweidimensionalen Daten liegen als Bilddaten vor. Der Anwendungsfall ist ein mobiler Roboter, der einen oder mehrere Tennisbälle auf einem Tennisplatz einsammeln soll. Es soll herausgearbeitet werden, ob es möglich ist, ein Machine learning Model darauf zu trainieren, präzise die Position eines Tennisballs auf dem Tennisfeld anhand eines Bildes zu bestimmen.\
Die Arbeit gliedert sich in mehrere Abschnitte. Zuerst wird die Problemstellung erläutert. Anschließend wird die Beschaffung der notwendigen Daten beschrieben. Auf diesen wird folgend eine Analyse durchgefüht sowie Feature Engineering betrieben. Im nächsten Schritt wird das Modelltraining erläutert, mit abschließender Evaluierung.

= Problemstellung
Die Idee ist es, einen Roboter zu entwicklen, der in der Lage ist, Tennisbälle auf einem Tennisplatz zu erkennen und einzusammeln. Der Roboter soll autonom agieren und in der Lage Sein, Tennisbälle zu erkennen, deren Position zu bestimmen, über den Tennisplatz navigieren sowie Hindernisse erkennen und vermeiden, um dann die Tennisbälle einsammeln und an einem bestimmten Ort ablegen zu können.\
Die Herausforderung besteht darin, dass der Roboter ohne weitere Hilfsmittel, wie z.B. eine externe, den Platz überblickenden Kamera die Positionen der Tennisbälle bestimmen soll.
Hierfür soll der Roboter mit mindestens einer Kamera ausgestattet werden, die Bilder des Tennisplatzes aufnimmt. Diese Bilder sollen dann mit Hilfe eines trainierten Machine Learning Modells analysiert werden, um die Position der Tennisbälle zu bestimmen.
Erste Überlegungen zur Form des Roboters lassen sich mit der eines Staubsaugerroboters vergleichen, der mit zwei Rädern angetrieben wird.
Das erschwert die Aufgabe der Positionsbestimmung insofern, dass der Roboter relativ klein ist und die Kamera in einem relativ flachen Winkel auf den Tennisplatz gerichtet ist.\
Der Roboter existiert noch nicht, sondern ist nur ein theoretisches Konstrukt. In dieser Arbeit soll es darum gehen die Machberkeit der Positionsbestimmung anhand Bilddaten zu prüfen.

= Datenbeschaffung
Für die vorliegende Arbeit wird ein Datensatz mit sog. unstrukturierten Daten benötigt. Diese Daten sollen in der Form von Bildern vorliegen. Die Bilder sollen Tennisbälle auf einem Tennisplatz zeigen und aus der Höhe eines mobilen, autonomen, Staubsaugerroboter ähnlichen Roboters aufgenommen werden.
Die Daten können Synthetisch oder Reale Daten sein sowie auf jeweils auf verschiedene Arten und Weisen beschaffen werden. Im folgenden werden beide Ansätze und ihre Beschaffungsmethoden diskutiert.

== Realistische Daten
== Manuelle Beschaffung
Da es sich bei dem Roboter um ein theoretisches Konstrukt handelt, ist es nicht möglich, die Daten mit einem echten Roboter zu beschaffen. Um trotzdem möglichst realistisch Daten zu erhalten ist es möglich, mit einer Kamera Bilder auf einem Tennisplatz aufzunhemen. Dafür könnten Tennisbälle an verschiedenen Positionen auf dem Tennisplat pletziert und aus verschiedenen Winkelen und Entfernungen fotografiert werden. Dabei wäre es wichtig zu beachten, zuvor eine feste Höhe zu bestimmen, auf der sich die Kamera des Roboters später einmal befinden soll. Die Kamera mit der die Bilder zum Training des Modells dann aufgenommen werden sollte dann für jedes Foto auf dieser Höhe platziert werden um für den späteren Anwendungsfall relevante Daten zu erhalten. Es sollte zusätzlich in betracht gezogen werden, die Höhe bei jedem Bild zu variieren oder für jede Kombination von Aufnahmewinkel und -position mehrere Bilder in einem Toleranzbereich um die bestimmte Höhe herum aufzunehmen. Dies soll ausschließen, dass das Modell nur auf einer bestimmten Höhe zuverlässig funktioniert.
Vorteile:
- realistische Daten
- entsrpechend genau dem späteren Anwendungsfall
Nachteile:
- aufwendig
- teuer, da Tennisplatz und Tennisbälle gemietet werden müssen
- nicht reproduzierbar
- Zeitaufwendig für große Datenmengen

== Internetrechere

== Synthetische Date
== Image Generation
== 3D Modelling



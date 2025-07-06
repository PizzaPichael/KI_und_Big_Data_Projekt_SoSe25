= Einführung

Die vorliegende Belegarbeit befasst sich mit dem Thema der Positionserkennung mittels Machine Learning. Genauer soll es darum gehen dreidimensionale Positionsdaten aus zweidimensionalen Daten zu bestimmen. Diese zweidimensionalen Daten liegen als Bilddaten vor. Der Anwendungsfall ist ein mobiler Roboter, der einen oder mehrere Tennisbälle auf einem Tennisplatz einsammeln soll. Es soll herausgearbeitet werden, ob es möglich ist, ein Machine learning Model darauf zu trainieren, präzise die Position eines Tennisballs auf dem Tennisfeld anhand eines Bildes zu bestimmen.\
Die Arbeit gliedert sich in mehrere Abschnitte. Zuerst wird die Problemstellung erläutert. Anschließend wird die Beschaffung der notwendigen Daten beschrieben. Auf diesen wird folgend eine Analyse durchgefüht sowie Feature Engineering betrieben. Im nächsten Schritt wird das Modelltraining erläutert, mit abschließender Evaluierung.

= Problemstellung
Diese Arbeit basiert auf der Idee, einen Roboter zu entwicklen, der in der Lage ist, Tennisbälle auf einem Tennisplatz zu erkennen und einzusammeln. Der Roboter soll autonom agieren und in der Lage sein Tennisbälle zu erkennen, deren Position zu bestimmen, über den Tennisplatz navigieren, Hindernisse erkennen und vermeiden, um dann die Tennisbälle einsammeln und an einem bestimmten Ort ablegen zu können.\
Die Herausforderung besteht darin, dass der Roboter ohne weitere Hilfsmittel, wie z.B. eine externe, den Platz überblickenden Kamera die Positionen der Tennisbälle bestimmen soll.
Hierfür soll der Roboter mit mindestens einer Kamera ausgestattet werden, die Bilder des Tennisplatzes aufnimmt. Diese Bilder sollen dann mit Hilfe eines trainierten Machine Learning Modells analysiert werden, um die Position der Tennisbälle zu bestimmen.
Erste Überlegungen zur Form des Roboters lassen sich mit der eines Staubsaugerroboters vergleichen, der mit zwei Rädern angetrieben wird.
Das erschwert die Aufgabe der Positionsbestimmung insofern, dass der Roboter relativ klein ist und die Kamera in einem relativ flachen Winkel auf den Tennisplatz gerichtet ist.\
Der Roboter existiert noch nicht, er ist nur ein theoretisches Konstrukt.

= Zielstellung
Diese Arbeit dient dazu erste Schritte in Richtung der finalen Positionserkennung mittels Bilddaten zu gehen. Es soll ein erster Ansatz für die Positionsbestimmung im drei dimensionalen Raum anhand zweidimensionaler Bilddaten geprüft werden und dessen Machbarkeit beurteilt werden. Dafür werde ich mich auf eine Kombination aus Objekterkennung und Regression stützen, in der ein Tennisball erkannt wird und dessen Entfernung zur Kamera/zum Roboter vorhergesagt werden soll.

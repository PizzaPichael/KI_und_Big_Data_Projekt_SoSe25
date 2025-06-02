= Datenbeschaffung
== Anforderungen an die Daten
Für die vorliegende Arbeit wird ein Datensatz mit sog. unstrukturierten Daten benötigt. Diese Daten sollen in der Form von Bildern vorliegen. Die Bilder sollen Tennisbälle auf einem Tennisplatz zeigen und aus der Höhe eines mobilen, autonomen, Staubsaugerroboter ähnlichen Roboters aufgenommen werden.\
#text(fill: red)[TODO: ausformulieren <]
Desweiteren:
- verschiedene Höhen?
- verschiedene Winkel
- verschiedene Abstände?
- verschiedene Hintergründe?
- mit und Ohne Menschen?

WEG?:
Die Daten können Synthetisch oder Reale Daten sein sowie auf jeweils auf verschiedene Arten und Weisen beschafft werden. Im folgenden werden beide Ansätze und ihre Beschaffungsmethoden diskutiert.
#text(fill: red)[>]


== Reale Daten

Reale Daten sind Daten, die echte Ereignisse, Zustände oder Interaktionen abbilden. Diese Daten werden meist durch Beobachtung gewonnen. Reale Daten können selber erzeugt oder aus externen Quellen beschafft werden.

=== Reale Daten selber erzeugen
Daten können selber erzeugt werden. Im falle unstrukturierter Bilddaten hieße das das Aufnehmen von Bildern mit einer Kamera. In unserem Anwendungsfall des Roboters, könnte diese Kamera z.B. auf dem Roboter montiert sein, der dann Bilder von Tennisbällen auf einem Tennispaltz aufnimmt. Dies würde reale Daten erzeugen, die sehr nah an der Problemstellung leigen.
Da es sich bei dem Roboter um ein theoretisches Konstrukt handelt, ist es nicht möglich, die Daten mit einem echten Roboter zu beschaffen. Um trotzdem möglichst realistische Daten zu erhalten ist es alternativ möglich, mit einer von einem Menschen gehaltenen Kamera Bilder auf einem Tennisplatz aufzunhemen. Dafür könnten Tennisbälle an verschiedenen Positionen auf dem Tennisplat platziert und aus verschiedenen Winkeln und Entfernungen fotografiert werden. Dabei wäre es wichtig zu beachten, zuvor eine feste Höhe zu bestimmen, auf der sich die Kamera des Roboters später einmal befinden soll. Die Kamera mit der die Bilder zum Training des Modells dann aufgenommen werden, sollte dann für jedes Foto auf dieser Höhe platziert werden um für den späteren Anwendungsfall relevante Daten zu erhalten. Es sollte zusätzlich in betracht gezogen werden, die Höhe bei jedem Bild, innerhalb eines Tolleranzbereichs, zu variieren oder für jede Kombination von Aufnahmewinkel und -position mehrere Bilder um die bestimmte Höhe herum aufzunehmen. Dies könnte ausschließen, dass das Modell nur auf einer bestimmten Höhe zuverlässig funktioniert.\
#text(fill: red)[TODO: ausformulieren <]\
Vorteile:
- realistische Daten
- entsprechen genau dem späteren Anwendungsfall
Nachteile:
- teuer, da Tennisplatz und Tennisbälle gemietet werden müssen
- nicht reproduzierbar
- Zeitaufwändig für große Datenmengen
#text(fill: red)[>]

=== Internetrechere
Es ist möglich realistische Daten zu erhalten, ohne diese selber gesammelt zu haben. Plattformen wie kaggle oder huggingface bieten neben vortrainierten Machine Learning Modellen öffentlich zugängliche Datensätze an, die genutzt werden können um eigene Modelle zu trainieren.
#text(fill: red)[TODO: ausformuleiren]
Vorteile:
- realistische Daten
- weniger Zeitaufwand
Nachteile:
- entspricht nicht genau dem späteren Anwendungsfall
- nicht für alles existiert bereits ein Datensatz
#text(fill: red)[>]

=== Konklusion, dass ich nicht realistische Daten nutzen werde
Auch wenn die Nutzung realer Daten viele Vorteile bietet, wie z.B. die mögliche Nähe zum späteren Anwendungsfall, ist es für mich aufgrund der genannten Nachteile nicht attraktiv reale Daten für diese Projektarbeit zu nutzen. Vor allem der Zeit- und Kostenaufwand bei der manuellen Beschaffung, sowie die spezifizität der Anforderungen an den Datensatz, die es schwer machen entsprechend relevante Daten für meinen Anwendungsfall mittels Internetrecherche zu finden, sind schwerwiegende Argumente gegen eine Nutzung realer Daten.

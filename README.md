Univerzitet u Beogradu, Elektrotehnički fakultet

**![A picture containing text Description automatically generated](media/a1be52461bf465d73032612400f340bd.jpg)**

**Fuzzy logika**

**Projekat**

**Studenti:    Profesor:**

Maja Stošić 2019/0064 Aleksandar Rakić

Kristina Stevanović 2019/0309

**Uvod**

-   **Zadatak:**

Dat je sistem sa funkcijom prenosa:

Za dati sistem, referencu u opsegu r ∈ [-2,2] i upravljenje u opsegu u ∈ [-1.2, 1.2] potrebno je projektovati fuzzy sistem upravljanja za praćenje reference i otklanjanje poremećaja. Kod praćenja reference potrebno je da se ona promeni sa njene minimalne na njenu maksimalnu vrednost a kod otklanjanja poremećaja referenca je nula tokom trajanja simulacije a poremećaj se javlja sa amplitudom jednakom polovini maksimalnog upravljanja.

-   **Pristup rešavanju:**

Za početak treba izabrati jedan od dva moguća pristupa upravljanju: intuitivni pristup ili fazifikaciju PID kontrolera. Za oba zahteva zadatka odlučujemo se za drugi pristup, budući da nam on omogućava da parametrima dobijenim praćenjem pravila za projektovanje dobijemo dobre performanse sistema koje kasnije lako možemo da usavršimo.

Projektovanje fuzzy kontrolera primenom fazifikacije PIDa podrazumeva praćenje seta pravila kojim dolazimo do parametara kontrolera. Proces projektovanja započinje se izvršavanjem eksperimenta za pronalaženje kritičnog pojačanja sistema. Nakon njega formiraćemo P regulator, kojem zatim dodajemo diferencijalno i integralno dejstvo. Na samom kraju izvršićemo nelinearizaciju samog kontrolera i parametre fino podesiti do dobijanja željenih performansi.

**Projektovanje P regulatora**

-   **Zieger-Nichols-ov eksperiment**

Projektovanje proporcionalnog regulatora započinje sa izvođenjem **Zieger-Nichols-**ove

![Table Description automatically generated](media/8b20e14f6f8242ac7549f8d57d1c2f27.png)metode za pronalaženje kritičnog pojačanja sistema. Na sistem u zatvorenoj sprezi na čijem je ulazu jedinična step funkcija, dovodimo različita pojačanja i posmatramo odziv. Pojačanje za koje sistem počinje da samoosciluje naziva se kritično pojačanje sitema. Pomoću njega i periode oscilacija dobijamo parametre PID kontrolera po sledećim formulama:

Eksperiment na našem sistemu prikazan je u nastavku:

![Text, letter Description automatically generated](media/f3f130c395d4c4e52fad8896c4450da6.png)

sistem u zatvorenoj sprezi pobudjen step referencom

![A picture containing chart Description automatically generated](media/c0b556e5e15811abc72aaa3534a295e8.png)

Sa grafika očitavamo:

Kkr=1.54

Tkr=53.177sec

Koristeći tabelu računamo parametre kontrolera:

Kp=0.6Kkr

Td=0.5Tkr

Ti=0.125Tkr

-   **Projektovanje fuzzy kontrolera**

Kada smo pronašli kritična pojačanja i parametre kontrolera, sledeći korak je projektovanje fuzzy kontrolera pomoću Matlab toolbox-a. Tokom projektovanja potrebno je pridržavati se određenih pravila kako bi dobijeni kontroler bio linearan:

1.  koristi se sugeno mašina
2.  univerzum svih ulaznih varijabli je [-1, 1];
3.  funkcije pripadnosti ulaynih varijabli su trougaone funkcije koje se međusobno preklapaju 50%
4.  univerzum izlazne varijable jednak je zbiru univerzuma ulaznih varijabli

Proporcionalni fuzzy kontroler za naš sistem imaće jednu ulaznu varijablu-grešku sistema i jednu izlaznu varijablu-upravlajnje; funkcije pripadnosti biće takve da zadovoljavaju gore navedena pravila. Greška u sistemu može biti nula, negativna i pozitivna dok upravljanje takođe može biti pozitivno, negativno ili nula. Pravila su napisana tako da upravljanje na pravi način odgovara na grešku.

![Diagram Description automatically generated](media/44d38f09a2a91d67359d348060537741.png)

![Chart, line chart Description automatically generated](media/7fb248576dda015e7858a36921714387.png)

![Graphical user interface Description automatically generated](media/df9c9cc8107213cd112126da266f07ae.png)

![Rectangle Description automatically generated with low confidence](media/428d1e5e4796379162be3551187f1c72.png)

Nakon projektovanja fuzzy kontrolera u Simulinku modelujemo ceo sistem. Budući da su univerzumi ulaznih varijabli [-1,1] moramo da skaliramo dobijene koeficijente za P regulator po formulama:

u_max=1.2;

Ku_P=u_max;

Kp_P = Kp/Ku_P

Takodje moramo da uvedemo blokove za saturaciju kako se ne bi dogodilo da do fuzzy kontrolera dođu nedozvoljene vrednosti.

![Chart, histogram Description automatically generated](media/450af2ba0929cdf8877688931dbf768f.png)![Diagram Description automatically generated](media/eaf892f7f83bac91932a0f803c445712.png)

Vidimo da sistem ne uspeva da dostigne referencu, što je i očekivano budući da imamo samo proporcionalno dejstvo u regulatoru i zato je sledeći korak u projektovanju uvođenje diferencijalnog dejstva.

**Projektovanje PD regulatora**

![Diagram Description automatically generated](media/4e35dec5b62030bf6338b7b669622e43.png) Za ostvarivanje boljih performansi uvodimo diferencijalno dejstvo. U fazi kontroler uvodimo novu ulaznu varijablu-izvod greške.To nam dodaje set od 6 novih pravila koji na pravi način regulišu upravljanje u odnosu na grešku i njen izvod.Osim ovih izmena, regulator projektujemo na isti način kao i proporcionalni, poštujući ista pravila.

![Chart, line chart Description automatically generated](media/88ec324e343b672d20a3ee8d9d1d40b4.png)

![Chart, line chart Description automatically generated](media/0c52b9b14bbb59d11a6e17da0dfcd13d.png)

![Graphical user interface Description automatically generated](media/59fc18b8f0242a29c4c18fea0c8e877a.png)

![Graphical user interface, text, application, chat or text message Description automatically generated](media/6d1e7b06d2f5eef8d91dc382760e1431.png)

![Diagram Description automatically generated](media/45bada5b2ab00188b1310439a7e6e611.png)

Sada u simulinku ponovo modelujemo ceo sistem sa dodatnim blokom za derivaciju i sa ponovo

Potrebno je i ponovo skalirati koeficijente po formulama:

Ku_PD = u_max/2

Kp_PD = Kp/Ku_PD

Kd_PD = Kp\*Td/Ku_PD

![A picture containing diagram Description automatically generated](media/e625d74fba7cef137909ecbc871fe889.png)

odziv sistema sa PD regulatorom na zadatu referencu

Vidimo da sistem i dalje ne uspeva da dostigne zadatu referencu ali da je uvođenjem diferencijalnog dejstva preskok smanjen. Za postizanje reference potrebno je uvesti i integralno dejstvo.

**Projektovanje PID regulatora**

![Diagram Description automatically generated](media/a8ace1c8904eb6cc2aaf4256ba36dce6.png) Za dodavanje integralnog dejstva nije potrebno menjati fuzzy kontroler, već samo dodati integrator i skalirati koeficijente.

![Graphical user interface Description automatically generated with low confidence](media/e2fa6a21d2b918f40616c2259a6de4b5.png)

Vidimo da sistem sada dostiže referencu ali se preskok povećao.Ovo ćemo rešiti uvođenjem nelinearnosti u fazi kontroler i finim podešavanjem parametara na kraju.

**Uvođenje nelinearnosti**

Nelinearnost uvodimo menjanjem funkcija pripadnosti na neke nelinearne funkcije (npr gausovske, sinusne..).Uvođenjem sinusne funkcije umesto trougaone, menjanju nam se i pravila budući da više nemamo funkciju pripadnosti koja predstavlja nulu za grešku i za upravljanje.

![Diagram Description automatically generated with medium confidence](media/3274a38357c7a21eb5072d97b513e474.png)

![Graphical user interface Description automatically generated](media/617eb01f72c1896e95422e21f34abb18.png)

![Graphical user interface Description automatically generated](media/d4221687ecdc4e8d90cc7081a92c8cb3.png)

![Graphical user interface Description automatically generated](media/b02c372dd96c683144333e12218d761c.png)

![Diagram Description automatically generated](media/e425d93d648d8ae681808efc71b54e3a.png)

simulink model sa nelinearnim kontrolerom

![A screenshot of a computer Description automatically generated with medium confidence](media/9eb88f1055091e962a27530e062e7aa5.png)Nakon finih podešavanja parametara dobijamo sistem koji dobro prati referencu:

Trazeni grafici

**Projektovanje kontrolera za potiskivanje poremećaja**

![Diagram Description automatically generated](media/fd559c46c28067a460783b892d1a0112.png) Potrebno je projektovati kontroler koji će otkloniti poremećaj koji se javlja sa ampitudom jednakoj polovini maksimalne vrednosti upravljanja a nakon smirivanja tranzijenta na negativnu vrednost amplitude. Za potiskivanje poremećaja koristićemo isti nelinearni fazi kontroler napravljen za praćenje reference, samo ćemo parametre izmeniti tako da postignemo željene performanse.

Modelovanje poremećaja:

![Graphical user interface, text, application, email Description automatically generated](media/fd275fd6f4a9baf7f0133fbb533ced29.png)![Graphical user interface, text, application, email Description automatically generated](media/3604aa115f59a2854ca07123e9d6b1d4.png)

![Chart, line chart Description automatically generated](media/01d82be88d581a4b127a29038f0fcf02.png)

Vidimo da sistem uspeva u relativno kratkom vremenskom interval da otkloni poremećaj.

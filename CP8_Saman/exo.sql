use base_exemple02;
SELECT hotel, 
    typeChambre, 
    DateDebut, 
    Prix 
from tarifs 
order by 
    DateDebut ASC, 
    Prix DESC;

    --------------------

use base_exemple02;
SELECT NumChambre, coalesce(Commentaire,'Pas de commentaire') AS Commentaire  
from chambres;


use base_exemple02;
SELECT * from chambres WHERE Commentaire IS NOT NULL;

SELECT * from hotels where Etoile = '***';

SELECT * FROM tarifs WHERE DateDebut BETWEEN '2021-04-01' AND '2021-04-31';

SELECT * from typeschambre WHERE Description LIKE '%WC%';

------------
use base_exemple02;
SELECT Libelle, Description, Prix, NumChambre FROM Tarifs 
JOIN Hotels ON hotels.idHotel = tarifs.hotel
JOIN typeschambre ON tarifs.typechambre = typesChambre.idtypeChambre
JOIN chambres ON chambres.hotel = hotels.idHotel
AND chambres.TypeChambre = typeschambre.idTypeChambre; 

----------------
use base_exemple02;
SELECT Libelle, NumChambre, Commentaire, Description FROM chambres ch
LEFT JOIN hotels h ON h.idHotel = ch.hotel
LEFT JOIN typeschambre typ ON ch.TypeChambre = typ.idTypeChambre;

----------------
use base_exemple02;
SELECT Libelle, Description 
FROM hotels, typeschambre;




use base_exemple02;
SELECT TypeChambre, Description, NumChambre
FROM chambres
JOIN typeschambre ON typeschambre.idTypeChambre = chambres.TypeChambre
GROUP BY typechambre;


use base_exemple02;
SELECT TypeChambre, Description, count(NumChambre) AS NumChambre
FROM chambres
JOIN typeschambre ON typeschambre.idTypeChambre = chambres.TypeChambre
GROUP BY typechambre;


use base_exemple02;
SELECT typeChambre, SUM(Prix) AS PRIX_CUMULE
FROM tarifs
GROUP BY typeChambre;


use base_exemple02;
SELECT typeChambre, description, min(prix) AS PRIX_MIN, max(prix) AS PRIX_MAX, count(prix) as NbTarifs
FROM tarifs
JOIN typeschambre ON tarifs.typechambre = typeschambre.idTypeChambre 
group by typeChambre;


use base_exemple02;
SELECT typeChambre, description, min(prix) AS PRIX_MIN, max(prix) AS PRIX_MAX, Avg(prix) as PRIX_MOYEN
FROM tarifs
JOIN typeschambre ON tarifs.typechambre = typeschambre.idTypeChambre 
GROUP BY typeChambre;



use base_exemple02;
use base_exemple02;
SELECT typeChambre, description, min(prix) AS PRIX_MIN, max(prix) AS PRIX_MAX, Avg(prix) as PRIX_MOYEN
FROM tarifs
JOIN typeschambre ON tarifs.typechambre = typeschambre.idTypeChambre 
GROUP BY typeChambre
HAVING min(prix) > 70;


SELECT typeChambre, description, DateDebut,
CASE 
	WHEN DateDebut BETWEEN "2021-04-01" AND "2021-09-30" THEN 'été 2021' 
    WHEN DateDebut BETWEEN "2021-10-01" AND "2022-03-31" THEN 'hiver 2022' 
    ELSE 'autre'
END AS Saison
FROM tarifs
JOIN typeschambre ON tarifs.typechambre = typeschambre.idTypeChambre
ORDER BY Saison ASC;
 
 
SELECT Libelle, Etoile, concat(Libelle, ' ', Etoile) AS Hotel
FROM hotels
JOIN chambres ON chambres.hotel = hotels.idHotel
GROUP BY hotel;
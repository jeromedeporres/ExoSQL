use base_exemple02;
SELECT typeChambre, description, min(prix) AS PRIX_MIN, max(prix) AS PRIX_MAX, count(prix) as NbTarifs
FROM tarifs
JOIN typeschambre ON tarifs.typechambre = typeschambre.idTypeChambre 
GROUP BY typeChambre;


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

SELECT hotels.libelle, NumChambre FROM chambres
JOIN hotels ON hotels.idHotel = chambres.hotel
WHERE NumChambre = (SELECT idTypeChambre FROM typeschambre WHERE description LIKE '%1 lit simple avec douche%');




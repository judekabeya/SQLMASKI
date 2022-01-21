                                                                                             """Requetes SQL cas Matski """

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------








                                                                                                    """ --- Q.1---"""



"""I/ Les articles """



select * from article where numarticle not in(select numarticle from detailcommande);

 numarticle | numcategorie | codetype | nomarticle | referenceinterne |   codebarre   | prixvente | coutachat
------------+--------------+----------+------------+------------------+---------------+-----------+-----------
          7 |           13 | P        | YOONER     | PA1242           | 3245673451462 |     55.00 |      0.00


          


          




"""II/ Les catégories """ 

select numcategorie, libellecategorie from categorie where numcategorie not in (select numcategorie from article where numarticle in (select numarticle from detailcommande)) and numcategorie not in (select numcategorie from categorie where numcategorie in (select cat_numcategorie2 from categorie));

 numcategorie | libellecategorie
--------------+------------------
            7 | Batons
            8 | Chaussures
           10 | Chaussures
           11 | Batons
           13 | Paret
           16 | Freestyle
           17 | Racing
           19 | Randonnée
           20 | Polyvalent
           22 | Alpine
           23 | Freeride
           24 | Skating
           25 | Alternatif



""" Il semblerait que l article numero 7 qui correspond au Yooner n'est jamais ete commande. 13 catégories n'ont jamais ete commandé.il serait interessant de supprimer cette donne afin de mieux exploiter le potentiel de cette table. On pourra penser à une meilleur communication autour de cet article afin qu elle ait une reel valeur ajoute au sein de la base.  """









                                                                                        """ --- Q.2---"""
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


select distinct to_char(datecommande, 'Month') as Month, extract(week from datecommande) as semaine, sum(montantht) as vente from commande where numclient in (select numclient from client where adressepaysclient like 'Suisse') group by datecommande; commande;


   month   | semaine |  vente
-----------+---------+----------
 December  |      50 | 50767.50
 November  |      45 |  9450.00
 October   |      41 |  5870.00




 """  Nous constatons a travers le chiffre d'affaires des differents mois que les ventes sont nettement importantes pour le mois de decembre  cela se justifie notamment par les periodes festivales, ou il est donc intéressant de consacrer tout son effort commercial. Le chiffre d'affaires avant l'action commerciale etait de 5 870£ pour le mois d'octobre et nous pouvons observer une progression de plus 10% pour atteindre un chiffre d'affaires passant à 9 450 £ pour atteindre un chiffre d'affaires de 50 767.50£ pour le mois de decembre une amelioration importantes ventes.""


                                                                                                                                                                                                                                                      """ --- Q.3---"""
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


--

 select nomclient from client where numclient not in(select numclient from commande);

---Les clients n'ayant jamais commandé---

        nomclient
-----------------------
 GO Sport Orange
 GO Sport Perpignan
 SPORT 2000 Bich
 Foot Locker Rome
 The North Face Reggio
 Nike Town
 Lillywhites


---Le pays n'ayant jamais commandé.---

  select distinct adressepaysclient from client where adressepaysclient not in(select adressepaysclient from client where numclient in(select numclient from commande));

 --- adressepaysclient
-------------------
 Royaume-Uni



 """ En effet il y a certains clients provenant notamment de la Royaume-uni qui n'ont jamais commandé. on pourra notamment grace à a leur email contenu dans la table tenter une action de relance commerciale proposer des nouveautés, en personnalisant les produits en fonction de l'historique d'achat du client ou de leur activités. ou des promotions pour un certaint montant de commande effectuer. (réduction, offre exclusive, livraison gratuite, code promo…)"""





 










-                                                                                             """ --- Q.4---"""
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

 Select * from detailcommande where quantitecommandee != quantitelivree;

 numcommande | numarticle | quantitecommandee | quantitelivree
-------------+------------+-------------------+----------------
           1 |          5 |                15 |             10
           3 |          3 |                 8 |              0
           3 |          4 |                15 |              0
           3 |          5 |                18 |              0
           5 |         22 |                 7 |              5
          13 |          5 |                15 |             10
          14 |         17 |                20 |             22
          14 |         18 |                20 |             22
          23 |          5 |                15 |             10
          24 |          8 |                20 |             22
          24 |          9 |                20 |             22




"""Il s’agit d’une situation assez inquiétante, étant donné qu’il pourrait s’agir de problème dans la livraison des commandes. En effet, nous avons pu observer des situations où le client reçoit plus ou moins que la quantité commandée. Cela pourrait impacter la situation économique de l’entreprise. """









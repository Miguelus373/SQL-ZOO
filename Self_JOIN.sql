-- Tutorial 
-- How many stops are in the database.

SELECT COUNT(id) 
FROM stops

-- Find the id value for the stop 'Craiglockhart'

SELECT id FROM stops
WHERE name = 'Craiglockhart'

-- Give the id and the name for the stops on the '4' 'LRT' service.

SELECT id, name FROM route
JOIN stops ON id=stop
WHERE company='LRT'
AND num=4
ORDER BY pos

-- Change the query so that it shows the services from Craiglockhart to London Road.

SELECT a.company, a.num, a.stop, b.stop
FROM route a JOIN route b ON
(a.company=b.company AND a.num=b.num)
WHERE a.stop=53
AND b.stop IN (SELECT id FROM stops
WHERE name='London Road')

-- Change the query so that the services between 'Craiglockhart' and 'London Road' are shown.

SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON
(a.company=b.company AND a.num=b.num)
JOIN stops stopa ON (a.stop=stopa.id)
JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart'
AND stopb.name='London Road'

-- Give a list of all the services which connect stops 115 and 137 ('Haymarket' and 'Leith')

SELECT DISTINCT a.company, b.num
FROM route a JOIN route b
ON a.num=b.num AND a.company=b.company
WHERE a.stop=115 AND b.stop=137

-- Give a list of the services which connect the stops 'Craiglockhart' and 'Tollcross'

SELECT a.company, a.num
FROM route a JOIN route b ON
(a.company=b.company AND a.num=b.num)
JOIN stops stopa ON (a.stop=stopa.id)
JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart'
AND stopb.name='Tollcross'
 
-- Give a distinct list of the stops which may be reached from 'Craiglockhart' by taking one bus

SELECT name, b.company, b.num
FROM route a JOIN route b ON
(a.company=b.company AND a.num=b.num)
JOIN stops ON b.stop=id
WHERE a.stop=53


-- Quiz
-- 1. Select the code that would show it is possible to get from Craiglockhart to Haymarket

SELECT DISTINCT a.name, b.name
FROM stops a JOIN route z ON a.id=z.stop
JOIN route y ON y.num = z.num
JOIN stops b ON y.stop=b.id
WHERE a.name='Craiglockhart' AND b.name ='Haymarket'

-- 2. Select the code that shows the stops that are on route.num '2A' which can be reached with one bus from Haymarket?

SELECT S2.id, S2.name, R2.company, R2.num
FROM stops S1, stops S2, route R1, route R2
WHERE S1.name='Haymarket' AND S1.id=R1.stop
AND R1.company=R2.company AND R1.num=R2.num
AND R2.stop=S2.id AND R2.num='2A'

-- 3. Select the code that shows the services available from Tollcross?

SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON (a.company=b.company AND a.num=b.num)
JOIN stops stopa ON (a.stop=stopa.id)
JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Tollcross'

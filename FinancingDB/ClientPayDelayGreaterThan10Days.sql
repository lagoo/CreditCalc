SELECT	
	c.Id,
	c.Name
FROM
	Clients c
INNER JOIN Financings f
	ON f.ClientId = c.Id
INNER JOIN (SELECT fi.FinancingId FROM FinancingInstallments fi WHERE DATEDIFF(day, fi.DueDate, fi.PaymentDate) > 10 GROUP BY FinancingId HAVING COUNT(1) > 2) fi
	ON fi.FinancingId = f.Id

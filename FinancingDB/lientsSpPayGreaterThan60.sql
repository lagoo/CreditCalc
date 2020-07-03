SELECT
	c.Id,
	c.Name
FROM
	(SELECT COUNT(1) Total, FinancingId  FROM FinancingInstallments fi GROUP BY FinancingId) total
INNER JOIN (SELECT COUNT(1) Total, FinancingId  FROM FinancingInstallments fi WHERE fi.PaymentDate is not null GROUP BY FinancingId) pay
	ON total.FinancingId = pay.FinancingId
INNER JOIN Financings f
	ON f.Id = pay.FinancingId
INNER JOIN Clients c
	ON c.Id = f.ClientId
WHERE
	((pay.Total * 100) / total.Total) >= 60
	AND
	c.UF = 'SP'
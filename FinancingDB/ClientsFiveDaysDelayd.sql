SELECT TOP(4)
	c.Id,
	c.Name
FROM 
	FinancingInstallments fi	
INNER JOIN Financings f
	ON fi.FinancingId = f.Id
INNER JOIN Clients c
	ON c.Id = f.ClientId
WHERE
	fi.DueDate < GETDATE()
	AND
	fi.PaymentDate is null
GROUP BY
	c.Id,
	c.Name
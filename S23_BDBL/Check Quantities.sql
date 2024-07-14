SELECT 
    p.P_Name AS Product_Name, 
    COALESCE(SUM(qc.Quantity), 0) AS Current_Quality
FROM 
    Product p
LEFT JOIN Qualitycontrol qc ON p.Productid = qc.Productid
WHERE 
    qc.Status = 'VALID'  -- Considering only 'VALID' quality control status
GROUP BY 
    P.Productid, P.P_Name;

SELECT 
    p.P_Name AS Product_Name, 
    r.M_Name AS Raw_Material_Name, 
    pr.Quantity AS Quantity_Used
FROM 
    Product p
JOIN Product_Rawmaterial pr ON p.Productid = pr.Productid
Join Rawmaterial R On Pr.Rawmaterialid = R.Rawmaterialid;




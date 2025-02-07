INSERT INTO Person (personId, firstName, lastName, phoneNumber) 
VALUES 
(1, 'John', 'Doe', '385-1234'),
(2, 'Jane', 'Smith', '435-5678'),
(3, 'Alice', 'Johnson', '801-8765'),
(4, 'Bob', 'Brown', '223-4321'),
(5, 'James', 'Fred', '645-9456');

INSERT INTO Apartment (apartmentId, rooms, baths, contractId, address) 
VALUES 
(1, 3, 2, 1, '123 Main St, Springfield, IL'),
(2, 2, 1, 2, '456 Elm St, Spanish Fork, UT'),
(3, 1, 1, 3, '789 Oak St, Washington DC, WA'),
(4, 4, 3, 4, '101 Pine St, Los Angeles, CA');

INSERT INTO Guarentor (guarentorId, identification, creditScore, personId) 
VALUES 
(4, 'ID901234', 690, 4);

INSERT INTO Tenant (tenantId, birthDate, income, personId) 
VALUES 
(1, '1990-05-15', 55000, 1),
(2, '1985-08-20', 62000, 2),
(3, '1999-12-17', 90500, 5);

INSERT INTO Employee (employeeId, salary, personId, employerId) 
VALUES 
(1, 45000, 3, 1);

INSERT INTO Contract (contractId, tenantId, guarenterId, monthlyCost, apartmentId, startDate, endDate) 
VALUES 
(1, 1, 1, 600, 1, '2024-01-01', '2025-01-01'),
(2, 2, 1, 900, 1, '2023-06-15', '2024-06-15'),
(3, 3, NULL, 1200, 2, '2023-06-15', '2024-06-15');

INSERT INTO Payment (paymentId, contractId, amountPayed, datePayed) 
VALUES 
(1, 1, 600, '2024-01-05'),
(2, 2, 900, '2023-06-20'),
(3, 1, 400, '2024-03-03'),
(4, 1, 200, '2023-09-15'),
(5, 2, 900, '2023-09-15');

INSERT INTO Management (managementId, managementName, apartmentId) 
VALUES 
(1, 'Springfield Property Management', 1),
(2, 'Spanish Fork Living Management', 2);

INSERT INTO Maintenance (maintenanceId, requestDate, apartmentId, problemDescription, status, employeeId, tenantRequestingId) 
VALUES 
(1, '2025-01-15', 1, 'Leaking faucet in the kitchen', FALSE, 1, 1),
(2, '2025-01-20', 1, 'Heating system not working', TRUE, 1, 2),
(3, '2025-01-25', 2, 'Broken window in the living room', FALSE, 1, 5);

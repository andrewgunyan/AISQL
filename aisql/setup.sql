CREATE TABLE Apartment (
    apartmentId INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    rooms INT NOT NULL,
    baths INT NOT NULL,
    contractId INT NOT NULL,
    address TEXT NOT NULL
);
CREATE TABLE Contract (
    contractId INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    tenantId INT NOT NULL,
    guarenterId INT,
    monthlyCost INT NOT NULL,
    apartmentId INT NOT NULL,
    startDate DATE NOT NULL,
    endDate DATE NOT NULL
);
CREATE TABLE Person (
    personId INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    firstName TEXT NOT NULL,
    lastName TEXT NOT NULL,
    phoneNumber TEXT NOT NULL
);
CREATE TABLE Guarentor (
    guarentorId INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    identification TEXT NOT NULL,
    creditScore INT NOT NULL,
    personId INT NOT NULL
);
CREATE TABLE Tenant (
    tenantId INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    birthDate DATE NOT NULL,
    income INT NOT NULL,
    personId INT NOT NULL
);
CREATE TABLE Management (
    managementId INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    managementName TEXT NOT NULL,
    apartmentId INT NOT NULL
);
CREATE TABLE Payment (
    paymentId INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    contractId INT NOT NULL,
    amountPayed INT NOT NULL,
    datePayed DATE NOT NULL
);
CREATE TABLE Maintenance (
    maintenanceId INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    requestDate DATE NOT NULL,
    apartmentId INT NOT NULL,
    problemDescription TEXT NOT NULL,
    status BOOLEAN NOT NULL,
    employeeId INT NOT NULL,
    tenantRequestingId INT NOT NULL
);
CREATE TABLE Employee (
    employeeId INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    salary INT NOT NULL,
    personId INT NOT NULL,
    employerId INT NOT NULL
);
ALTER TABLE Contract ADD CONSTRAINT contract_guarenterid_foreign FOREIGN KEY(guarenterId) REFERENCES Guarentor(guarentorId);
ALTER TABLE Management ADD CONSTRAINT management_apartmentid_foreign FOREIGN KEY(apartmentId) REFERENCES Apartment(apartmentId);
ALTER TABLE Maintenance ADD CONSTRAINT maintenance_tenantrequestingid_foreign FOREIGN KEY(tenantRequestingId) REFERENCES Tenant(tenantId);
ALTER TABLE Maintenance ADD CONSTRAINT maintenance_employeeid_foreign FOREIGN KEY(employeeId) REFERENCES Employee(employeeId);
ALTER TABLE Payment ADD CONSTRAINT payment_contractid_foreign FOREIGN KEY(contractId) REFERENCES Contract(contractId);
ALTER TABLE Apartment ADD CONSTRAINT apartment_contractid_foreign FOREIGN KEY(contractId) REFERENCES Contract(contractId);
ALTER TABLE Contract ADD CONSTRAINT contract_tenantid_foreign FOREIGN KEY(tenantId) REFERENCES Tenant(tenantId);
ALTER TABLE Employee ADD CONSTRAINT employee_personid_foreign FOREIGN KEY(personId) REFERENCES Person(personId);
ALTER TABLE Maintenance ADD CONSTRAINT maintenance_apartmentid_foreign FOREIGN KEY(apartmentId) REFERENCES Apartment(apartmentId);
ALTER TABLE Employee ADD CONSTRAINT employee_employerid_foreign FOREIGN KEY(employerId) REFERENCES Management(managementId);
ALTER TABLE Tenant ADD CONSTRAINT tenant_personid_foreign FOREIGN KEY(personId) REFERENCES Person(personId);
ALTER TABLE Guarentor ADD CONSTRAINT guarentor_personid_foreign FOREIGN KEY(personId) REFERENCES Person(personId);

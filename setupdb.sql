CREATE TABLE Apartment (
    apartmentId INT UNSIGNED PRIMARY KEY,
    rooms INT,
    baths INT,
    contractId INT,
    address TEXT  ,
    FOREIGN KEY (contractId) REFERENCES Contract (contractId)
);

CREATE TABLE Contract (
    contractId INT UNSIGNED PRIMARY KEY,
    tenantId INT,
    guarenterId INT,
    monthlyCost INT,
    apartmentId INT,
    startDate DATE  ,
    endDate DATE  ,
    FOREIGN KEY (tenantId) REFERENCES Tenant (tenantId),
    FOREIGN KEY (guarenterId) REFERENCES Guarentor (guarentorId),
    FOREIGN KEY (apartmentId) REFERENCES Apartment (apartmentId)
);

CREATE TABLE Person (
    personId INT UNSIGNED PRIMARY KEY,
    firstName TEXT  ,
    lastName TEXT  ,
    phoneNumber TEXT  
);

CREATE TABLE Guarentor (
    guarentorId INT UNSIGNED PRIMARY KEY,
    identification TEXT  ,
    creditScore INT,
    personId INT,
    FOREIGN KEY (personId) REFERENCES Person (personId)
);

CREATE TABLE Tenant (
    tenantId INT UNSIGNED PRIMARY KEY,
    birthDate DATE  ,
    income INT,
    personId INT,
    FOREIGN KEY (personId) REFERENCES Person (personId)
);

CREATE TABLE Management (
    managementId INT UNSIGNED PRIMARY KEY,
    managementName TEXT,
    apartmentId INT,
    FOREIGN KEY (apartmentId) REFERENCES Apartment (apartmentId)
);

CREATE TABLE Payment (
    paymentId INT UNSIGNED PRIMARY KEY,
    contractId INT,
    amountPayed INT,
    datePayed DATE,
    FOREIGN KEY (contractId) REFERENCES Contract (contractId)
);

CREATE TABLE Maintenance (
    maINTenanceId INT UNSIGNED PRIMARY KEY,
    requestDate DATE,
    apartmentId INT,
    problemDescription TEXT,
    status BOOLEAN,
    employeeId INT,
    tenantRequestingId INT,
    FOREIGN KEY (apartmentId) REFERENCES Apartment (apartmentId),
    FOREIGN KEY (employeeId) REFERENCES Employee (employeeId),
    FOREIGN KEY (tenantRequestingId) REFERENCES Tenant (tenantId)
);

CREATE TABLE Employee (
    employeeId INT UNSIGNED PRIMARY KEY,
    salary INT,
    personId INT,
    employerId INT,
    FOREIGN KEY (personId) REFERENCES Person (personId),
    FOREIGN KEY (employerId) REFERENCES Management (managementId)
);

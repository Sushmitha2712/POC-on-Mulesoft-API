CREATE TABLE Person (
    FullName               VARCHAR(100),
    Gender                 VARCHAR(20),
    Address                VARCHAR(255),
    Phone                  VARCHAR(15),
    EmailId                VARCHAR(100),
    DateOfBirth            DATE,
    Role                   VARCHAR(50),
    RoleType               VARCHAR(50),
    StartDate              DATE,
    EndDate                DATE,
    Description            TEXT,
    IdentificationNumber   VARCHAR(50),
    Flag                   VARCHAR(20),
    ModifiedDate           TIMESTAMP
);
INSERT INTO Person (
    FullName, Gender, Address, Phone, EmailId, DateOfBirth, Role,
    RoleType, StartDate, EndDate, Description, IdentificationNumber,
    Flag, ModifiedDate
)
VALUES
(
    'John Doe', 'Male', '123 Main St', '9876543210', 'john.doe@example.com', '1985-06-15',
    'Employee', 'Full-Time', '2023-01-01', '2025-01-01', 'Senior Developer',
    'EMP12345', 'new', '2025-06-01 10:30:00'
),
(
    'Jane Smith', 'Female', '456 Oak Ave', '8765432109', 'jane.smith@example.com', '1990-03-22',
    'User', 'Part-Time', '2022-05-01', '2024-05-01', 'Project Manager',
    'USR54321', 'new', '2025-06-01 10:30:00'
),
(
    'Alex Brown', 'Other', '789 Pine Rd', '7654321098', 'alex.brown@example.com', '1988-11-30',
    'Seller', 'Contract', '2024-06-01', '2026-06-01', 'External Vendor',
    'SEL78901', 'new', '2025-06-01 10:30:00'
);

USE master;
GO

-- Craete the Farm databse only if it does not already exist
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'Farm')
BEGIN
    CREATE DATABASE Farm;
END
GO

-- Switch to the Farm database
USE Farm;
GO
-- Craete Chicken table
CREATE TABLE Chicken (
    ChickID INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(50) NOT NULL,
    Breed VARCHAR(50) NOT NULL,
    Age INT NOT NULL,
    EggProduction DECIMAL(5,2) NOT NULL, -- eggs per day
    IsPregnant BIT NOT NULL, -- 1 for yes, 0 for no
    LastVetCheck DATE NOT NULL
);
GO

-- Insert data into Chicken table
INSERT INTO Chicken (Name, Breed, Age, EggProduction, IsPregnant, LastVetCheck)
VALUES
('Jeffy', 'Holstein', 5, 25.5, 1, '2026-04-01'),
('Bessie', 'Jersey', 3, 18.0, 0, '2026-04-01'),
('Dolly', 'Brown Swiss', 4, 22.0, 1, '2026-04-01');
GO

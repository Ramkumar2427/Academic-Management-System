-- Event Management System

CREATE DATABASE EventsManagement;

use EventsManagement;

CREATE TABLE Events (
    Event_Id INT PRIMARY KEY AUTO_INCREMENT,
    Event_Name VARCHAR(255),
    Event_Date DATE,
    Event_Location VARCHAR(255),
    Event_Description TEXT
);
CREATE TABLE Attendees (
    Attendee_Id INT PRIMARY KEY AUTO_INCREMENT,
    Attendee_Name VARCHAR(255),
    Attendee_Phone VARCHAR(20),
    Attendee_Email VARCHAR(255),
    Attendee_City VARCHAR(100)
);


CREATE TABLE Registrations (
    Registration_Id SERIAL PRIMARY KEY,
    Event_Id INT,
    Attendee_Id INT,
    Registration_Date DATE,
    Registration_Amount NUMERIC(10, 2),
    FOREIGN KEY (Event_Id) REFERENCES Events(Event_Id),
    FOREIGN KEY (Attendee_Id) REFERENCES Attendees(Attendee_Id)
);


INSERT INTO Events (Event_Name, Event_Date, Event_Location, Event_Description)
VALUES
  ('Tech Conference', '2023-06-15', 'Downtown Convention Center', 'Annual technology conference'),
  ('Music Festival', '2023-07-20', 'Lakeside Park', 'Outdoor music festival'),
  ('Business Expo', '2023-09-01', 'City Exhibition Hall', 'Exhibition for local businesses'),
  ('Art Gallery Opening', '2023-11-12', 'Main Street Gallery', 'Showcase of local artists'),
  ('Cooking Class', '2023-12-05', 'Culinary Academy', 'Learn to cook gourmet meals');


INSERT INTO Attendees (Attendee_Name, Attendee_Phone, Attendee_Email, Attendee_City)
VALUES
  ('John Doe', '123-456-7890', 'john.doe@example.com', 'New York'),
  ('Jane Smith', '987-654-3210', 'jane.smith@example.com', 'Los Angeles'),
  ('Michael Johnson', '555-123-4567', 'michael.johnson@example.com', 'Chicago'),
  ('Emily Davis', '111-222-3333', 'emily.davis@example.com', 'Seattle'),
  ('David Lee', '444-555-6666', 'david.lee@example.com', 'Miami');


INSERT INTO Registrations (Event_Id, Attendee_Id, Registration_Date, Registration_Amount)
VALUES
  (1, 1, '2023-06-01', 99.99),
  (2, 2, '2023-07-10', 79.99),
  (3, 3, '2023-08-15', 49.99),
  (4, 4, '2023-11-01', 39.99),
  (5, 5, '2023-11-30', 59.99);
  

  
  INSERT INTO Events (Event_Name, Event_Date, Event_Location, Event_Description) VALUES
('Business Summit', '2024-12-05', 'Chicago', 'A summit for business professionals.');

UPDATE Events
SET Event_Location = 'San Diego', Event_Date = '2024-11-25'
WHERE Event_Id = 3;

-- To delete the event from the event tables, the specific event to be deleted has to be first removed from registrations table as it refer its event id with event table event_id.
delete from registrations
where event_id = 2;
DELETE FROM Events
WHERE Event_Location = 'Lakeside Park';

INSERT INTO Attendees (Attendee_Name, Attendee_Phone, Attendee_Email, Attendee_City) VALUES
('Bob Brown', '222-333-4444', 'bob.brown@example.com', 'Seattle');

INSERT INTO Registrations (Event_Id, Attendee_Id, Registration_Date, Registration_Amount) VALUES
(1, 4, '2024-08-15', 120.00);

SELECT * FROM Events;
SELECT Attendees.Attendee_Name, Attendees.Attendee_Email
FROM Attendees
JOIN Registrations ON Attendees.Attendee_Id = Registrations.Attendee_Id
WHERE Registrations.Event_Id = 1;

SELECT e.Event_Name, SUM(r.Registration_Amount) AS Total_Registration_Amount
FROM Events e
JOIN Registrations r ON e.Event_Id = r.Event_Id
GROUP BY e.Event_Name;


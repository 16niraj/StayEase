CREATE DATABASE IF NOT EXISTS stayease;
USE stayease;

-- ROLES
INSERT INTO roles (Role_ID, Role_Name, Description) VALUES
(1, 'Student', 'Regular resident of the hostel'),
(2, 'Warden', 'Manages a specific hostel block'),
(3, 'Admin', 'Overall system administrator');

-- STAFF MEMBERS (Explicitly setting IDs so they map perfectly)
INSERT INTO members (Member_ID, First_Name, Last_Name, Gender, Age, Contact_Number, Email, Emergency_Contact, Role_ID, Status) VALUES
(100, 'Super', 'Admin', 'M', 45, '9999999999', 'admin@stayease.com', '9999999998', 3, 'Active'),
(102, 'Riya', 'Patel', 'F', 32, '9876500002', 'riya@stayease.com', '9876500003', 2, 'Active'),
(106, 'Rakesh', 'Verma', 'M', 38, '9876500006', 'rakesh@stayease.com', '9876500007', 2, 'Active'),
(108, 'Vikram', 'Desai', 'M', 41, '9876500008', 'vikram@stayease.com', '9876500009', 2, 'Active');

-- HOSTELS (Assigning the Wardens)
INSERT INTO hostels (Hostel_ID, Hostel_Name, Hostel_Type, Total_Floors, Warden_ID) VALUES
(1, 'Yamuna Hostel', 'Girls', 3, 102), -- Riya is Warden here
(2, 'Narmada Hostel', 'Boys', 4, 106),  -- Rakesh is Warden here
(3, 'Ganga Hostel', 'Boys', 5, 108);   -- Vikram is Warden here

-- ROOMS
INSERT INTO rooms (Room_ID, Room_Number, Hostel_ID, Floor_Number, Capacity) VALUES
(201, '201', 1, 2, 2), -- Yamuna Rooms
(202, '202', 1, 2, 2),
(101, '101', 2, 1, 2), -- Narmada Rooms
(102, '102', 2, 1, 2),
(301, '101', 3, 1, 2),  -- Ganga Rooms
(302, '102', 3, 1, 2);

-- STUDENTS
INSERT INTO members (Member_ID, First_Name, Last_Name, Gender, Age, Contact_Number, Email, Emergency_Contact, Role_ID, Status) VALUES
(110, 'Priya', 'Sharma', 'F', 20, '8888800001', 'priya@student.com', '7777700001', 1, 'Active'),
(111, 'Ananya', 'Gupta', 'F', 19, '8888800002', 'ananya@student.com', '7777700002', 1, 'Active'),
(112, 'Rahul', 'Singh', 'M', 21, '8888800003', 'rahul@student.com', '7777700003', 1, 'Active'),
(113, 'Karan', 'Kumar', 'M', 20, '8888800004', 'karan@student.com', '7777700004', 1, 'Active'),
(114, 'Amit', 'Patel', 'M', 20, '8888800005', 'amit@student.com', '7777700005', 1, 'Active'),
(115, 'Rohan', 'Sharma', 'M', 19, '8888800006', 'rohan@student.com', '7777700006', 1, 'Active'),
(116, 'Neha', 'Singh', 'F', 21, '8888800007', 'neha@student.com', '7777700007', 1, 'Active'),
(117, 'Sneha', 'Reddy', 'F', 20, '8888800008', 'sneha@student.com', '7777700008', 1, 'Active'),
(118, 'Arjun', 'Das', 'M', 19, '8888800009', 'arjun@student.com', '7777700009', 1, 'Active'),
(119, 'Kabir', 'Khan', 'M', 22, '8888800010', 'kabir@student.com', '7777700010', 1, 'Active');

-- ROOM ALLOCATIONS (Putting students into their rooms)
INSERT INTO room_allocations (Member_ID, Room_ID, Allocation_Date, Status) VALUES
(110, 201, '2026-01-10', 'Active'), -- Priya in Yamuna
(111, 202, '2026-01-12', 'Active'), -- Ananya in Yamuna
(112, 101, '2026-01-15', 'Active'), -- Rahul in Narmada
(113, 102, '2026-01-18', 'Active'), -- Karan in Narmada
(114, 301, '2026-02-01', 'Active'), -- Amit goes to Ganga
(115, 301, '2026-02-05', 'Active'), -- Rohan shares with Amit in Ganga
(116, 201, '2026-02-10', 'Active'), -- Neha shares with Priya in Yamuna
(117, 202, '2026-02-12', 'Active'), -- Sneha shares with Ananya in Yamuna
(118, 302, '2026-02-15', 'Active'), -- Arjun gets his own room in Ganga
(119, 101, '2026-02-20', 'Active'); -- Kabir shares with Rahul in Narmada

-- COMPLAINT TYPES
INSERT INTO complaint_types (Complaint_Type_ID, Type_Name, Sub_Type) VALUES
(1, 'Plumbing', 'Water Leakage'),
(2, 'Electrical', 'Fan/Light Not Working'),
(3, 'Civil', 'Broken Window'),
(4, 'IT', 'Wi-Fi Issue');

-- COMPLAINTS
INSERT INTO complaints (Member_ID, Complaint_Type_ID, Description, Submission_Date, Status, Resolved_Date) VALUES
(110, 1, 'Tap in bathroom is leaking constantly.', '2026-03-15', 'Pending', NULL),           -- Yamuna Pending
(111, 4, 'Wi-Fi keeps dropping in room 202.', '2026-03-10', 'Resolved', '2026-03-11'),       -- Yamuna Resolved
(112, 2, 'Ceiling fan makes a loud noise.', '2026-03-17', 'Pending', NULL);                  -- Narmada Pending

-- FEE STRUCTURES
INSERT INTO fee_structures (Fee_Type_ID, Fee_Name, Amount, Academic_Year) VALUES
(1, 'Semester Hostel Rent', 25000.00, '2025-2026'),
(2, 'Gym Membership', 2000.00, '2025-2026');

-- PAYMENTS
INSERT INTO payments (Payment_ID, Member_ID, Fee_Type_ID, Payment_Date, Amount_Paid, Payment_Status, Transaction_Reference) VALUES
(1, 110, 1, '2026-01-05', 25000.00, 'Success', 'TXN-998877'),
(2, 110, 2, '2026-01-06', 2000.00, 'Success', 'TXN-998878'),
(3, 112, 1, '2026-01-10', 25000.00, 'Success', 'TXN-998879');


-- FURNITURE INVENTORY (Equipping the rooms we created)
INSERT INTO furniture_inventory (Furniture_ID, Item_Name, Room_ID, Purchase_Date, Current_Condition) VALUES
(1, 'Single Bed', 201, '2023-05-10', 'Good'),
(2, 'Study Table', 201, '2023-05-10', 'Damaged'), -- Something for Riya to fix!
(3, 'Single Bed', 202, '2023-05-10', 'Good'),
(4, 'Study Table', 202, '2023-05-10', 'Good'),
(5, 'Single Bed', 101, '2022-08-15', 'Good'),
(6, 'Wardrobe', 101, '2022-08-15', 'Good'),
(7, 'Single Bed', 102, '2024-01-20', 'Good');

-- MEMBER MOVEMENT LOGS (Tracking students entering/exiting)

INSERT INTO member_movement_logs (Movement_ID, Member_ID, Exit_Time, Entry_Time, Purpose) VALUES
(1, 110, '2026-03-17 08:30:00', '2026-03-17 14:00:00', 'Attending College Lectures'),
(2, 112, '2026-03-17 18:00:00', '2026-03-17 21:30:00', 'Going to the Gym'),
(3, 111, '2026-03-18 09:00:00', '2026-03-18 13:45:00', 'Lab Work'),
(4, 113, '2026-03-18 20:00:00', NULL, 'Going home for the weekend'); -- NULL means they haven't returned yet!

-- VISITOR LOGS (Tracking guests)
INSERT INTO visitor_logs (Log_ID, Visitor_Name, Contact_Number, ID_Proof_Type, ID_Proof_Number, Host_Member_ID, Entry_Time, Purpose) VALUES
(1, 'Ramesh Sharma', '9876543210', 'Aadhar Card', '1234-5678-9012', 110, '2026-03-15 10:00:00', 'Visiting daughter'),
(2, 'Suresh Singh', '8765432109', 'Driving License', 'DL-9876543', 112, '2026-03-16 16:30:00', 'Delivering books'),
(3, 'Neha Gupta', '7654321098', 'College ID', 'STU-2025-001', 111, '2026-03-18 11:15:00', 'Group Study');


-- Adding random AI generated fake image for now 

-- Update Image_Path for Female Members with realistic-looking AI placeholder URLs
-- We will assign a unique illustrative URL to each female member ID.
UPDATE members
SET Image_Path =
    CASE Member_ID
        WHEN 102 THEN 'https://fakeface.rest/portraits/female/5.jpg' -- Riya (Warden)
        WHEN 110 THEN 'https://fakeface.rest/portraits/female/12.jpg' -- Priya
        WHEN 111 THEN 'https://fakeface.rest/portraits/female/23.jpg' -- Ananya
        WHEN 116 THEN 'https://fakeface.rest/portraits/female/37.jpg' -- Neha
        WHEN 117 THEN 'https://fakeface.rest/portraits/female/45.jpg' -- Sneha
        -- If we add more female members later, they will get a generic female placeholder for consistency.
        ELSE 'https://fakeface.rest/portraits/female/1.jpg'
    END
WHERE Gender = 'F' AND Role_ID IN (1, 2);

-- Update Image_Path for Male Members with realistic-looking AI placeholder URLs
UPDATE members
SET Image_Path =
    CASE Member_ID
        WHEN 100 THEN 'https://fakeface.rest/portraits/male/8.jpg' -- Super Admin
        WHEN 106 THEN 'https://fakeface.rest/portraits/male/18.jpg' -- Rakesh (Warden)
        WHEN 108 THEN 'https://fakeface.rest/portraits/male/29.jpg' -- Vikram (Warden)
        WHEN 112 THEN 'https://fakeface.rest/portraits/male/50.jpg' -- Rahul
        WHEN 113 THEN 'https://fakeface.rest/portraits/male/61.jpg' -- Karan
        WHEN 114 THEN 'https://fakeface.rest/portraits/male/72.jpg' -- Amit
        WHEN 115 THEN 'https://fakeface.rest/portraits/male/83.jpg' -- Rohan
        WHEN 118 THEN 'https://fakeface.rest/portraits/male/94.jpg' -- Arjun
        WHEN 119 THEN 'https://fakeface.rest/portraits/male/99.jpg' -- Kabir
        -- Generic male placeholder for any future additions.
        ELSE 'https://fakeface.rest/portraits/male/1.jpg'
    END
WHERE Gender = 'M' AND Role_ID IN (1, 2, 3); -- Students, Wardens, and Admins

-- Set default for inactive members
UPDATE members
SET Image_Path = 'uploads/default.png'
WHERE Status = 'Inactive';

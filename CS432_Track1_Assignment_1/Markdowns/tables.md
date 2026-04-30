# 🏨 StayEase – Hostel Management System

## 1️⃣ Roles
**Purpose:** Defines system-level roles and permissions.

### Roles
- **Role_ID** (PK, INT, NOT NULL)  
- **Role_Name** (VARCHAR, NOT NULL, UNIQUE)  
  - e.g., Student, Warden, Technician  
- **Description** (TEXT, NOT NULL)

---

## 2️⃣ Members
**Purpose:** Stores all individuals associated with the hostel.

### Members
- **Member_ID** (PK, INT, NOT NULL)  
- **First_Name** (VARCHAR, NOT NULL)  
- **Last_Name** (VARCHAR)  
- **Gender** (VARCHAR, NOT NULL)  
- **Age** (INT, NOT NULL, CHECK (Age > 0))  
- **Contact_Number** (VARCHAR, NOT NULL, UNIQUE)  
- **Email** (VARCHAR, NOT NULL, UNIQUE)  
- **Emergency_Contact** (VARCHAR)  
- **Image_Path** (VARCHAR)  
- **Role_ID** (FK, INT, NOT NULL) → Roles(Role_ID)  
- **Status** (VARCHAR, NOT NULL)  
  - Allowed values: `Active`, `Inactive`

---

## 3️⃣ Hostels
**Purpose:** Represents hostel buildings.

### Hostels
- **Hostel_ID** (PK, INT, NOT NULL)  
- **Hostel_Name** (VARCHAR, NOT NULL, UNIQUE)  
- **Hostel_Type** (VARCHAR, NOT NULL)  
  - e.g., Boys, Girls  
- **Total_Floors** (INT, NOT NULL)  
- **Warden_ID** (FK, INT, NOT NULL) → Members(Member_ID)

---

## 4️⃣ Rooms
**Purpose:** Stores room-level details.

### Rooms
- **Room_ID** (PK, INT, NOT NULL)  
- **Room_Number** (VARCHAR, NOT NULL)  
- **Hostel_ID** (FK, INT, NOT NULL) → Hostels(Hostel_ID)  
- **Floor_Number** (INT, NOT NULL)  
- **Capacity** (INT, NOT NULL, CHECK (Capacity > 0))

**Constraints**
- `UNIQUE (Hostel_ID, Room_Number)`  
-  Room occupancy is derived using active room allocations.

---

## 5️⃣ Room_Allocations
**Purpose:** Maintains historical and active room assignments.

### Room_Allocations
- **Allocation_ID** (PK, INT, NOT NULL)  
- **Member_ID** (FK, INT, NOT NULL) → Members(Member_ID)  
- **Room_ID** (FK, INT, NOT NULL) → Rooms(Room_ID)  
- **Allocation_Date** (DATE, NOT NULL)  
- **Check_Out_Date** (DATE)  
- **Status** (VARCHAR, NOT NULL)  
  - Allowed values: `Active`, `Inactive`

**Constraints**
- `CHECK (Check_Out_Date > Allocation_Date OR Check_Out_Date IS NULL)`  
- A member can have only one **Active** allocation at a time (logical constraint).

---

## 6️⃣ Furniture_Inventory
**Purpose:** Tracks furniture items in each room.

### Furniture_Inventory
- **Furniture_ID** (PK, INT, NOT NULL)  
- **Item_Name** (VARCHAR, NOT NULL)  
  - e.g., Bed, Table  
- **Room_ID** (FK, INT, NOT NULL) → Rooms(Room_ID)  
- **Purchase_Date** (DATE, NOT NULL)  
- **Current_Condition** (VARCHAR, NOT NULL)  
  - e.g., Good, Damaged  

---

## 7️⃣ Visitor Log
**Purpose:** Stores details of non-hostel visitors only.

### Visitor_Logs
- **Log_ID** (PK, INT, NOT NULL)  
- **Visitor_Name** (VARCHAR, NOT NULL)  
- **Contact_Number** (VARCHAR, NOT NULL, UNIQUE)  
- **ID_Proof_Type** (VARCHAR, NOT NULL)  
- **ID_Proof_Number** (VARCHAR, NOT NULL, UNIQUE)
- **Host_Member_ID** (FK, INT, NOT NULL) → Members(Member_ID)  
- **Entry_Time** (TIMESTAMP, NOT NULL)
- **Purpose** (VARCHAR, NOT NULL)

---

## 8 Member_Movement_Logs
**Purpose:** Tracks hostel exit/entry of members (students/wardens).

### Member_Movement_Logs
- **Movement_ID** (PK, INT, NOT NULL)  
- **Member_ID** (FK, INT, NOT NULL) → Members(Member_ID)  
- **Exit_Time** (TIMESTAMP, NOT NULL)  
- **Entry_Time** (TIMESTAMP)  
- **Purpose** (VARCHAR, NOT NULL)

**Constraints**
- `CHECK (Entry_Time > Exit_Time OR Entry_Time IS NULL)`

---

## 9 Fee_Structures
**Purpose:** Defines types of fees.

### Fee_Structures
- **Fee_Type_ID** (PK, INT, NOT NULL)  
- **Fee_Name** (VARCHAR, NOT NULL)  
  - e.g., Hostel Rent, Mess Rent, Laundry Rent
- **Amount** (DECIMAL(10,2), NOT NULL)  
- **Academic_Year** (VARCHAR, NOT NULL)

---

## 10 Payments
**Purpose:** Tracks payments made by members.

### Payments
- **Payment_ID** (PK, INT, NOT NULL)  
- **Member_ID** (FK, INT, NOT NULL) → Members(Member_ID)  
- **Fee_Type_ID** (FK, INT, NOT NULL) → Fee_Structures(Fee_Type_ID)  
- **Payment_Date** (DATE, NOT NULL)  
- **Amount_Paid** (DECIMAL(10,2), NOT NULL)  
- **Payment_Status** (VARCHAR, NOT NULL)  
  - Allowed values: `Success`, `Failed`  
- **Transaction_Reference** (VARCHAR, NOT NULL, UNIQUE)

---

## 11 Complaint_Types
**Purpose:** Master table for complaint classification.

### Complaint_Types
- **Complaint_Type_ID** (PK, INT, NOT NULL)  
- **Type_Name** (VARCHAR, NOT NULL)  
  - e.g., Electrical, Mechanical, Civil
- **Sub_Type** (VARCHAR, NOT NULL)  
  - e.g., Fan, Switch, AC 

---

## 12 Complaints
**Purpose:** Stores complaint records.

### Complaints
- **Complaint_ID** (PK, INT, NOT NULL)  
- **Member_ID** (FK, INT, NOT NULL) → Members(Member_ID)  
- **Complaint_Type_ID** (FK, INT, NOT NULL) → Complaint_Types(Complaint_Type_ID)  
- **Description** (TEXT, NOT NULL)  
- **Submission_Date** (DATE, NOT NULL)  
- **Resolved_Date** (DATE)  
- **Status** (VARCHAR, NOT NULL)  
  - Allowed values: `Pending`, `In Progress`, `Resolved`

**Logical Constraint**
- If `Status = 'Resolved'` → `Resolved_Date` must **NOT** be NULL.

---

# StayEase – Hostel Management System 

**Course Assignment:** CS 432- Databases
**Assignment Type:** Relational Database Design & Implementation  

---

## Project Overview

**StayEase** is a comprehensive database system designed to digitize and streamline the daily operations of a hostel. Currently, many institutions rely on manual registers or disconnected spreadsheets, leading to errors in room allocation, fee tracking, and complaint redressal. 

This project solves these issues by providing a centralized, relational database structure that ensures data integrity, efficient retrieval, and real-time tracking of hostel resources.

### Project Objectives
* To replace manual record-keeping with a structured **SQL Database**.
* To enforce **Data Integrity** using Primary Keys, Foreign Keys, and Check Constraints.
* To manage critical hostel functions: **Admissions, Room Allocation, Fees, Staff Management, and Grievances.**

---

## Assignment Objectives

* Design a normalized relational database (3NF compliant)
* Implement strong referential integrity using foreign keys
* Enforce domain and business constraints
* Support real-world hostel workflows
* Maintain data consistency and security

---

## Key Features (Functionalities)

The system supports the following core modules:

1.  **Room Management:** Tracks total rooms, capacity, occupancy status, and furniture assets.
2.  **Member Administration:** Stores detailed profiles, emergency contacts, and guardian details.
3.  **Fee Management:** Handles fee structures (Hostel/Mess), tracks payments, and identifies pending dues.
4.  **Complaint Redressal:** A digital log for students to report maintenance issues, tracked until resolution.
5.  **Visitors & Security:** Logs visitor entry/exit times to ensure safety and restrict unauthorized access.
---

## Database Schema

The database `StayEase` consists of **12 Relational Tables** normalized to 3NF.

### **Entity Tables**
| Table Name | Description |
| :--- | :--- |
| **`Hostels`** | Stores details of different blocks (e.g., Kaveri, Ganga) and the Warden in-charge. |
| **`Rooms`** | Tracks room numbers, capacity, type (AC/Non-AC), and current occupancy. |
| **`Members`** | **(Core)** Stores student details. Includes strict validation for Age and Contact info. |
| **`Roles`** | Stores the role of the member. |
| **`Furniture Inventory`** | Tracks furniture and assets (Beds, Fans) assigned to specific rooms. |
| **`FeeStructure`** | Defines standard fee rates (e.g., Rent, Mess) for the academic year. |

### **Transaction Tables**
| Table Name | Description |
| :--- | :--- |
| **`RoomAllocations`** | Links Members to Rooms with Start/End dates. Tracks history of residence. |
| **`FeePayments`** | Records individual payment transactions linked to the Fee Structure. |
| **`Complaint Types`** | Master table for complaint classification. |
| **`Complaints`** | Logs grievances filed by students and their current status (Open/Resolved). |
| **`VisitorLogs`** | Store details of visitors and Time-stamped logs of visitor entry and exit. |
| **`Member Movement Logs`** | Time-stamped logs of members entry and exit. |


---
## Entity-Relationship Highlights

* All entities are **strong entities**
* No weak entities required
* No recursive relationships
* No ternary relationships required
* Many-to-many relationships resolved using associative entities
* Total participation used where logically required

### Example Relationships

* Roles → Members (1:N)
* Hostels → Rooms (1:N)
* Members → Room_Allocations (1:N)
* Rooms → Room_Allocations (1:N)
* Members → Payments (1:N)
* Fee_Structures → Payments (1:N)
* Members → Complaints (1:N)
* Complaint_Types → Complaints (1:N)

---

## Technical Details

* **Database Engine:** MySQL (Compatible with standard SQL)
* **Design Paradigm:** Relational Database (RDBMS)
* **Key Constraints Implemented:**
    * `PRIMARY KEY`: Unique identification for all entities.
    * `FOREIGN KEY`: Enforces relationships (e.g., A room belongs to a Hostel).
    * `CHECK`: Logical validation (e.g., `Salary > 0`, `ExitTime > EntryTime`).
    * `NOT NULL`: Ensures critical data (Contact Info, Names) is never missing.
    * `ON DELETE CASCADE/SET NULL`: Maintains referential integrity during deletions.

---

# Design Decisions

* Surrogate primary keys used for simplicity and consistency
* Associative entities used for relationships with attributes
* No derived attributes stored physically (calculated via queries)
* Hostel assignment derived through room allocation
* Avoided unnecessary direct relationships to maintain normalization

---

## Setup & Installation

To run this project on your local machine:

1.  **Install a Database Server:** MySQL Workbench, XAMPP, or PostgreSQL.
2.  **Open the SQL File:** Locate `stayease_ddl.sql` in this repository.
3.  **Execute Script:**
    * Open your SQL Query Editor.
    * Copy-paste the script content.
    * Run the script (usually the ⚡ or "Execute" button).
4.  **Verify:**
    * Run `USE StayEase;`
    * Run `SHOW TABLES;` to confirm all 12 tables are created.
5. If you want to add some test data to the tables, then locate `stayease_dml.sql` in this repository and repeat the step 3.


---

## Repository Structure

* **`SQL Codes`**: Contains the `.sql` source code for database creation and data insertion.
* **`Markdowns`**: Contains table structures and individual SQL codes for all tables.
* **`Reports`**: Contains the Project Report and ER Diagrams.
* **`README.md`**: Project documentation.

---

> **Note:** This project is for educational purposes as part of the CS432- Databases assignment.

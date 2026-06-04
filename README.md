# StayEase: Hostel Management System

![Python](https://img.shields.io/badge/Python-3.10%2B-blue)
![Flask](https://img.shields.io/badge/Flask-Backend-green)
![MySQL](https://img.shields.io/badge/MySQL-Database-orange)
![Locust](https://img.shields.io/badge/Locust-Load_Testing-red)

**StayEase** is a comprehensive, distributed hostel management system built as a semester-long group project for **CS 432: Databases** at the **Indian Institute of Technology (IIT), Gandhinagar**. 

This repository showcases the evolution of a database system from a basic conceptual design to a fully custom-built local database engine, and finally to a horizontally scaled, distributed MySQL cluster.

---

## My Individual Contributions
*Note: This was a collaborative group project. To provide transparency for recruiters and reviewers, my specific technical contributions to the system include:*

* **Assignment 1 (Database Schema Design):** Co-designed the foundational Entity-Relationship (ER) diagram and defined the relational database schema, establishing strict foreign key constraints, table relationships, and data integrity rules.
* **Assignment 2 (Full-Stack API & Authentication):** Architected the entire web application interface and backend. Developed a RESTful Flask API featuring Role-Based Access Control (RBAC) and JWT-secured authentication, seamlessly integrating complex backend SQL logic with the frontend.
* **Assignment 3 (ACID Validation, Concurrency & Performance Testing):** Engineered a custom Python stress-testing framework and configured Locust load-testing scripts to simulate 500+ concurrent users, rigorously benchmarking the system's concurrency limits and transaction durability.
* **Assignment 4 (Distributed Systems & Sharding):** Spearheaded the Shard Key Selection and Data Partitioning strategy. Designed a Hash-Based (Modulo 3) routing algorithm to distribute transactional data across a 3-node cluster, and engineered Python migration scripts to cleanly separate Sharded Data from Replicated Reference Data.

---

## System Architecture & Evolution

The project was developed in four distinct phases, each adding complexity and real-world database engineering concepts.

### Phase 1: Relational Design (`CS432_Track1_Assignment_1/`)
* **Objective:** Conceptualize and design a normalized relational schema.
* **Highlights:** Created complex ER Diagrams, defined strict schema rules, and wrote baseline DDL/DML SQL scripts to handle students, wardens, security guards, rooms, and complaints.

### Phase 2: Custom DB Engine & Web API (`CS432_Track1_Assignment_2/`)
* **Objective:** Understand how databases work under the hood by building one from scratch, then connect it to a web interface.
* **Highlights:** * **Module A:** Built a custom database storage engine in Python utilizing **B+ Trees** for rapid indexing and retrieval (`bplustree.py`).
  * **Module B:** Developed a RESTful **Flask Application** with role-based access control (Admin, Warden, Security, Student) to interact with the database.

### Phase 3: ACID Validation and Load Testing (`CS432_Track1_Assignment_3/`)
* **Objective:** Ensure data integrity under heavy traffic and system crashes.
* **Highlights:** * Implemented a **Transaction Manager** with **Write-Ahead Logging (WAL)** for crash recovery.
  * Conducted rigorous stress testing and benchmarking using **Locust**, analyzing the system's performance metrics before and after simulated traffic spikes.

### Phase 4: Horizontal Scaling & Sharding (`CS432_Track1_Assignment_4/`)
* **Objective:** Break the monolith. Migrate the application to a distributed architecture.
* **Highlights:**
  * Transitioned the database to a 3-node distributed MySQL cluster.
  * Implemented **Direct Routing** for O(1) single-key lookups.
  * Implemented **Scatter-Gather Routing** to aggregate cross-shard range queries.
  * Replicated static reference data across all nodes to bypass MySQL's inability to execute cross-server `JOIN` operations.

---

## Tech Stack
* **Backend:** Python, Flask, JWT Authentication
* **Database Management:** MySQL, Custom B+ Tree Engine, Write-Ahead Logging (WAL)
* **Performance Testing:** Locust
* **Frontend:** HTML5, CSS3, Vanilla JavaScript, Fetch API

---

## Repository Navigation

```text
StayEase-CS432
 ┣ CS432_Track1_Assignment_1  # ER Diagrams & DDL/DML Scripts
 ┣ CS432_Track1_Assignment_2  # B+ Tree Implementation & Flask Monolith
 ┣ CS432_Track1_Assignment_3  # Transaction Manager, WAL, & Locust Stress Tests
 ┗ CS432_Track1_Assignment_4  # Sharded Cluster Setup, Migration Scripts & Router
 
```

## Setup & Installation (Assignment 4 - Current State)

### 1. Clone the Repository

```bash
git clone https://github.com/16niraj/StayEase.git
cd StayEase/CS432_Track1_Assignment_4/stayease_sharded_web
```

### 2. Install Dependencies

```bash
pip install -r requirements.txt
```

### 3. Database Setup

Ensure three MySQL instances are running on ports **3307**, **3308**, and **3309**.

Run the migration script to partition the data:

```bash
python app/migrate_to_cluster.py
```

### 4. Run the Application

```bash
python app/app.py
```

The application will be available at:

```text
http://127.0.0.1:5000
```

---
### Disclaimer
*This project was developed strictly for educational purposes as part of the **CS 432: Databases** coursework at the **Indian Institute of Technology (IIT), Gandhinagar**. It is a conceptual academic project and is not intended for commercial use, production deployment, or handling real-world sensitive data.*
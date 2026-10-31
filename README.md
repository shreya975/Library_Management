# 📚 Library Management System | MySQL

A SQL-based Library Management System built using **MySQL** to manage books, library members, and borrowing records. This project demonstrates relational database design and practical SQL queries for retrieving, managing, and analyzing library data.

## 🎯 Project Overview

The project uses a relational database consisting of three main tables:

- **Books:** Stores book details, authors, genres, and available copies.
- **Members:** Maintains member information and registration dates.
- **Borrowing:** Tracks book borrowing and return records.

## 🛠️ Tech Stack

- **Database:** MySQL
- **Query Language:** SQL
- **Database Tool:** MySQL Workbench

## ✨ Key Features

- Book and member record management.
- Track book borrowing and return activities.
- Identify books that have not been returned.
- Analyze the most and least borrowed books.
- Calculate average borrowing duration.
- Retrieve member-wise borrowing history.
- Analyze book availability and genre distribution.

## 🗄️ Database Schema

**Database Name:** `LibraryDB`

| Table | Description |
|---|---|
| Books | Book details and availability |
| Members | Library member information |
| Borrowing | Borrowing and return records |

**Relationships:**

- One book can have multiple borrowing records.
- One member can have multiple borrowing records.
- Each borrowing record references a book and a member.

## 🧠 SQL Concepts Used

This project demonstrates:

- Database and table creation
- Primary Keys
- INSERT and SELECT statements
- WHERE and DISTINCT
- INNER JOIN and LEFT JOIN
- GROUP BY and HAVING
- Aggregate functions (COUNT, AVG)
- ORDER BY and LIMIT
- Date functions (DATEDIFF, CURDATE)
- NULL handling

## 📊 Analysis Performed

The project includes 12 practical SQL queries covering:

1. Retrieving all book records.
2. Filtering members by registration date.
3. Finding books with low availability.
4. Displaying borrowing history with member and book details.
5. Identifying unreturned books.
6. Analyzing members borrowing books across different genres.
7. Finding the top 3 most borrowed books.
8. Counting books by genre.
9. Retrieving member-specific borrowing history.
10. Finding books borrowed in the last 30 days.
11. Calculating average borrowing duration.
12. Identifying the least borrowed book.

## 📂 Project Structure

```text
Library_Management/
│
├── Library_Management_Project.sql
└── README.md
```

## 🚀 Getting Started

**1. Clone the repository**

```bash
git clone https://github.com/shreya975/Library_Management.git
```

**2. Open the SQL file**

Open `Library_Management_Project.sql` in MySQL Workbench.

**3. Execute the script**

Run the SQL script to create the database, tables, insert sample records, and execute the queries.

**4. Verify the database**

```sql
USE LibraryDB;
SHOW TABLES;
```

## 📈 Learning Outcomes

- Practical experience with MySQL and relational databases.
- Understanding table relationships and SQL joins.
- Data filtering, grouping, and aggregation.
- Writing analytical SQL queries.
- Using SQL to solve real-world data management problems.

## 🔮 Future Improvements

- Add foreign key constraints.
- Introduce book due dates and fine calculations.
- Implement stored procedures and SQL views.
- Build an interactive dashboard using Power BI.

## 👩‍💻 Author

**Shreya Mahajan**

Aspiring Data Scientist | Python | SQL | Data Analytics | Machine Learning

[GitHub Profile](https://github.com/shreya975) · [Project Repository](https://github.com/shreya975/Library_Management)

---

⭐ If you find this project useful, consider giving it a star!

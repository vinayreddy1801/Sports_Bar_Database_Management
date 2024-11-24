# Sports Bar Database Management System

## Project Overview
The **Sports Bar Database Management System** is designed to streamline the operations of a sports bar by transitioning its processes from paper to a fully digital database. The database tracks employees, customers, food and drink menus, orders, table reservations, and more. This system enhances customer service, ensures accurate order management, and provides insights into business performance.

---

## Features
- **Employee Management**:
  - Tracks employee check-in and check-out timings to avoid discrepancies.
  - Stores employee details, roles (bartender, chef, server), and work schedules.

- **Customer Management**:
  - Manages customer information, including reservations and order history.
  - Allows online food and drink orders to improve service efficiency.

- **Menu Management**:
  - Maintains detailed food and drink menus with pricing.
  - Supports menu updates for real-time synchronization.

- **Order and Reservation Management**:
  - Tracks orders (food and drinks) placed by customers, linking them to servers.
  - Handles dine-in table and bar chair reservations for better space utilization.

- **Analytics and Reporting**:
  - Provides insights into customer preferences, employee performance, and sales trends.
  - Helps in decision-making regarding inventory and service improvements.

---

## Technologies Used
- **Database Management System**: SQL Server Management Studio (SSMS)
- **Programming**: SQL
- **Documentation**: Microsoft Word

---

## Database Structure
The database includes the following key tables:
1. **Employee**: Tracks employee details such as ID, name, and role.
2. **Customers**: Stores customer information for dine-in and online orders.
3. **Food_Menu**: Contains food item details, including pricing and categories.
4. **Alcohol_Menu**: Lists alcoholic beverages and pricing.
5. **Orders**: Links customers to food and drink orders.
6. **Tables and Chairs**: Tracks availability and reservations of tables and chairs.
7. **TVs and Channels**: Manages TV locations and channels playing at specific times.

---

## Example Queries
### Top-Selling Food Items
```sql
SELECT food_name, COUNT(*) AS frequency 
FROM food_orders fo 
JOIN food_menu fm ON fo.food_id = fm.food_id 
GROUP BY food_name 
ORDER BY frequency DESC;

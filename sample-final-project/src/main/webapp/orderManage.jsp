<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Management</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f4f6f9;
        }
        .sidebar {
            background-color: #0056b3;
            color: white;
            height: 100vh;
            position: fixed;
            top: 0;
            left: 0;
            width: 250px;
        }
        .sidebar a {
            color: white;
            padding: 15px;
            text-decoration: none;
            display: block;
            font-size: 16px;
        }
        .sidebar a:hover {
            background-color: #004085;
        }
        .main-content {
            margin-left: 260px;
            padding: 20px;
        }
        footer {
            background-color: #0056b3;
            color: white;
            padding: 10px;
            text-align: center;
            position: fixed;
            bottom: 0;
            width: 100%;
        }
    </style>
</head>
<body>

<!-- Sidebar -->
<div class="sidebar">
    <h2 class="text-center py-4">Artevo Admin</h2>
    <a href="adminDashboard.jsp">Dashboard</a>
    
    <a href="artistManage.jsp">Artist Management</a>
    <a href="artworkManage.jsp">Artwork Management</a>
    <a href="orderManage.jsp">Order Management</a>
    <a href="#">Logout</a>
</div>

<!-- Main Content -->
<div class="main-content">
    <!-- Top Navbar -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Admin Dashboard</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <h5>Order Management</h5>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Order Management Section -->
    <div class="container mt-4">
        <h2>Manage Orders</h2>
        <p>Track and manage all orders placed by customers. You can view the order details, update the order status, and more.</p>

        <!-- Order Table -->
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>#</th>
                    <th>Order ID</th>
                    <th>Customer Name</th>
                    <th>Artwork Title</th>
                    <th>Category</th>
                    <th>Total Price</th>
                    
                </tr>
            </thead>
            <tbody id="order-list">
                <!-- Sample Data, Replace with Real Data from DB -->
                <tr>
                    <td>1</td>
                    <td>1001</td>
                    <td>Alex </td>
                    <td>Floral Delight</td>
                    <td>Wall Painting</td>
                    <td>Rs1500</td>
                    
                </tr>
                <tr>
                    <td>2</td>
                    <td>1002</td>
                    <td>Sithar</td>
                    <td>Wall of Colors</td>
                    <td>Wall Painting</td>
                    <td>Rs.2500</td>
                    
                </tr>
                <tr>
                    <td>3</td>
                    <td>1003</td>
                    <td>John</td>
                    <td>Modern Canvas</td>
                    <td>Canvas</td>
                    <td>Rs.3000</td>
                    
                </tr>
                <tr>
                    <td>4</td>
                    <td>1004</td>
                    <td>Devika</td>
                    <td>Portrait of Beauty</td>
                    <td>Portraits</td>
                    <td>Rs.2000</td>
                    
                </tr>
            </tbody>
        </table>
    </div>

    <!-- View Order Details Modal -->
    <!-- <div class="modal fade" id="viewOrderModal" tabindex="-1" aria-labelledby="viewOrderModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="viewOrderModalLabel">Order Details</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <h5>Order ID: <span id="order-id"></span></h5>
                    <p><strong>Customer Name:</strong> <span id="order-customer"></span></p>
                    <p><strong>Total Price:</strong> ₹<span id="order-price"></span></p>
                    <p><strong>Items:</strong></p>
                    <ul id="order-items">
                        List of items in the order
                    </ul>
                    <p><strong>Status:</strong> <span id="order-status"></span></p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div> -->

</div>

<!-- Footer -->
<footer>
    <p>&copy; 2024 Artevo. All Rights Reserved.</p>
    <p><a href="terms.jsp">Terms & Conditions</a> | <a href="privacy.jsp">Privacy Policy</a></p>
</footer>

<!-- Bootstrap JS & Popper.js -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<!-- <script>
    // Function to view order details
    function viewOrderDetails(orderId) {
        // Mock order details
        const orderDetails = {
            "1": {
                "id": "1001",
                "customer": "Alex",
                "price": 1500,
                "items": ["Floral Delight"],
                "status": "Pending"
            },
            "2": {
                "id": "1002",
                "customer": "Sithar",
                "price": 2500,
                "items": ["Wall of Colors"],
                "status": "Shipped"
            },
            "3": {
                "id": "ORD1003",
                "customer": "ജോൺ ദേ (John Dey)",
                "price": 3000,
                "items": ["Modern Canvas"],
                "status": "Pending"
            },
            "4": {
                "id": "ORD1004",
                "customer": "ദേവിക (Devika)",
                "price": 2000,
                "items": ["Portrait of Beauty"],
                "status": "Cancelled"
            }
        };

        // Update modal with order details
        const order = orderDetails[orderId];
        document.getElementById("order-id").textContent = order.id;
        document.getElementById("order-customer").textContent = order.customer;
        document.getElementById("order-price").textContent = order.price;
        document.getElementById("order-status").textContent = order.status;

        const orderItemsList = document.getElementById("order-items");
        orderItemsList.innerHTML = "";
        order.items.forEach(item => {
            const li = document.createElement("li");
            li.textContent = item;
            orderItemsList.appendChild(li);
        });
    }

    // Function to update order status
    function updateOrderStatus(orderId, status) {
        // This would be an AJAX call or a form submission to update the status in the backend
        alert(`Order ${orderId} status updated to: ${status}`);
        location.reload();  // Reload the page to reflect changes
    }
</script> -->

</body>
</html>


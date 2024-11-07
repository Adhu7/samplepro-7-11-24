<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Artwork Management</title>
    <!-- Include Bootstrap CSS -->
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
    <a href="admin-login.jsp" class="btn btn-logout">Logout</a>
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
                        <h5>Artwork Management</h5>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Artwork Management Section -->
    <div class="container mt-4">
        <div class="row">
            <div class="col-md-12">
                <h2>Manage Artworks</h2>
                <p>Manage all artworks, including adding, editing, and removing them. Categorize artworks by type, price, or artist.</p>

                <!-- Add Artwork Button -->
                <button class="btn btn-primary mb-3" data-bs-toggle="modal" data-bs-target="#addArtworkModal">Add New Artwork</button>

                <!-- Artwork Table -->
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Artwork Title</th>
                            <th>Artist</th>
                            <th>Price</th>
                            <th>Category</th>
                            <!-- <th>Status</th> -->
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody id="artwork-list">
                        <!-- Sample Data, Replace with Real Data from DB -->
                        <tr>
                            <td>1</td>
                            <td>Portrait of kathakali & thaiyam</td>
                            <td>Das</td>
                            <td>Rs.500</td>
                            <td>Portrait</td>
                            <!-- <td><span class="badge bg-success">Available</span></td> -->
                            <td>
                                <button class="btn btn-info btn-sm" data-bs-toggle="modal" data-bs-target="#editArtworkModal" onclick="editArtwork(1)">Edit</button>
                                <button class="btn btn-danger btn-sm" onclick="deleteArtwork(1)">Delete</button>
                            </td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>Floral Painting</td>
                            <td>Raghavan</td>
                            <td>Rs.1000</td>
                            <td>Wall Painting</td>
                            
                            <td>
                                <button class="btn btn-info btn-sm" data-bs-toggle="modal" data-bs-target="#editArtworkModal" onclick="editArtwork(2)">Edit</button>
                                <button class="btn btn-danger btn-sm" onclick="deleteArtwork(2)">Delete</button>
                            </td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>Canvas of Goddess</td>
                            <td>Ravi Varma</td>
                            <td>Rs.2000</td>
                            <td>Canvas</td>
                            <!-- <td><span class="badge bg-warning">Pending</span></td> -->
                            <td>
                                <button class="btn btn-info btn-sm" data-bs-toggle="modal" data-bs-target="#editArtworkModal" onclick="editArtwork(2)">Edit</button>
                                <button class="btn btn-danger btn-sm" onclick="deleteArtwork(2)">Delete</button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <!-- Add Artwork Modal -->
  <!--   <div class="modal fade" id="addArtworkModal" tabindex="-1" aria-labelledby="addArtworkModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addArtworkModalLabel">Add New Artwork</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="add-artwork-form">
                        <div class="mb-3">
                            <label for="artwork-title" class="form-label">Artwork Title</label>
                            <input type="text" class="form-control" id="artwork-title" required>
                        </div>
                        <div class="mb-3">
                            <label for="artwork-artist" class="form-label">Artist</label>
                            <input type="text" class="form-control" id="artwork-artist" required>
                        </div>
                        <div class="mb-3">
                            <label for="artwork-price" class="form-label">Price</label>
                            <input type="number" class="form-control" id="artwork-price" required>
                        </div>
                        <div class="mb-3">
                            <label for="artwork-category" class="form-label">Category</label>
                            <select class="form-select" id="artwork-category" required>
                                <option value="Floral-painting">Floral Painting</option>
                                <option value="Portrait">Portrait</option>
                                <option value="Wall-Painting">Wall-painting</option>
                                <option value="Canvas">Canvas</option>
                                <option value="Digital">Digital</option> -->
                           <!--  </select>
                        </div>
                        <button type="submit" class="btn btn-primary">Add Artwork</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    Edit Artwork Modal
    <div class="modal fade" id="editArtworkModal" tabindex="-1" aria-labelledby="editArtworkModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="editArtworkModalLabel">Edit Artwork</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="edit-artwork-form">
                        <div class="mb-3">
                            <label for="edit-artwork-title" class="form-label">Artwork Title</label>
                            <input type="text" class="form-control" id="edit-artwork-title" required>
                        </div>
                        <div class="mb-3">
                            <label for="edit-artwork-artist" class="form-label">Artist</label>
                            <input type="text" class="form-control" id="edit-artwork-artist" required>
                        </div>
                        <div class="mb-3">
                            <label for="edit-artwork-price" class="form-label">Price</label>
                            <input type="number" class="form-control" id="edit-artwork-price" required>
                        </div>
                        <div class="mb-3">
                            <label for="edit-artwork-category" class="form-label">Category</label>
                            <select class="form-select" id="edit-artwork-category" required>
                                <option value="Landscape">Floral Painting</option>
                                <option value="Portrait">Portrait</option>
                                <option value="Abstract">Wall-painting</option>
                                <option value="Photography">Canvas</option>
                                <option value="Digital">Digital</option>
                            </select>
                        </div>
                        <button type="submit" class="btn btn-primary">Update Artwork</button>
                    </form>
                </div>
            </div>
        </div>
    </div> --> -->

</div>

<!-- Footer -->
<footer>
    <p>&copy; 2024 Artevo. All Rights Reserved.</p>
    <p><a href="terms.jsp">Terms & Conditions</a> | <a href="privacy.jsp">Privacy Policy</a></p>
</footer>

<!-- Bootstrap JS & Popper.js -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<!-- <script>
    // Add Artwork (mock logic)
    document.getElementById('add-artwork-form').onsubmit = function(e) {
        e.preventDefault();
        alert('New artwork added!');
        // Submit form data to backend (AJAX or form submission)
        location.reload(); // Refresh to reflect changes
    };

    // Edit Artwork (mock logic)
    function editArtwork(artworkId) {
        // Fetch current data (mock)
        const artworkTitle = "Thaiyam & Kathakali"; // Example title
        const artworkArtist = "Das";           // Example artist
        const artworkPrice = 500;                   // Example price
        const artworkCategory = "Half thaiyyam and half kathakali";        // Example category

        // Fill the form with current data
        document.getElementById('edit-artwork-title').value = artworkTitle;
        document.getElementById('edit-artwork-artist').value = artworkArtist;
        document.getElementById('edit-artwork-price').value = artworkPrice;
        document.getElementById('edit-artwork-category').value = artworkCategory;

        document.getElementById('edit-artwork-form').onsubmit = function(e) {
            e.preventDefault();
            alert('Artwork updated!');
            // Update artwork data in backend
            location.reload(); // Refresh to reflect changes
        };
    }

    // Delete Artwork (mock logic)
    function deleteArtwork(artworkId) {
        if (confirm("Are you sure you want to delete this artwork?")) {
            // Delete artwork from the database (backend logic needed)
            alert('Artwork ' + artworkId + ' deleted!');
            location.reload(); // Refresh to reflect changes
        }
    }
</script> -->

</body>
</html>

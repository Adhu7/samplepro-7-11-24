<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Artist Management</title>
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
                        <h5>Artist Management</h5>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Artist Management Section -->
    <div class="container mt-4">
        <div class="row">
            <div class="col-md-12">
                <h2>Manage Artists</h2>
                <p>Review artist profiles, approve new artists, and edit existing profiles.</p>

                <!-- Artist Table -->
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Artist Name</th>
                            <th>Genre</th>
                           
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody id="artist-list">
                        <!-- Sample Data, Replace with Real Data from DB -->
                        <tr>
                            <td>1</td>
                            <td>Ravi Varma</td>
                            <td>Canvas</td>
                           
                            <td>
                                
                                <button class="btn btn-info btn-sm" data-bs-toggle="modal" data-bs-target="#editArtistModal" onclick="editArtist(1)">Edit</button>
                                <button class="btn btn-danger btn-sm" onclick="deleteArtist(1)">Delete</button>
                            </td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>Das</td>
                            <td>Portrait</td>
                           
                            <td>
                                
                                <button class="btn btn-info btn-sm" data-bs-toggle="modal" data-bs-target="#editArtistModal" onclick="editArtist(2)">Edit</button>
                                <button class="btn btn-danger btn-sm" onclick="deleteArtist(2)">Delete</button>
                            </td>
                        </tr>
                        <tr>
                            <td>3</td>
                            <td>Raghavan</td>
                            <td>Wall Painting</td>
                           
                            <td>
                                
                                <button class="btn btn-info btn-sm" data-bs-toggle="modal" data-bs-target="#editArtistModal" onclick="editArtist(3)">Edit</button>
                                <button class="btn btn-danger btn-sm" onclick="deleteArtist(3)">Delete</button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <!-- Edit Artist Modal -->
<!--     <div class="modal fade" id="editArtistModal" tabindex="-1" aria-labelledby="editArtistModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="editArtistModalLabel">Edit Artist</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="edit-artist-form">
                        <div class="mb-3">
                            <label for="edit-artist-name" class="form-label">Artist Name</label>
                            <input type="text" class="form-control" id="edit-artist-name" required>
                        </div>
                        <div class="mb-3">
                            <label for="edit-artist-genre" class="form-label">Genre</label>
                            <input type="text" class="form-control" id="edit-artist-genre" required>
                        </div>
                        <button type="submit" class="btn btn-primary">Update Artist</button>
                    </form>
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
    // Approve artist (mock logic)
    function approveArtist(artistId) {
        if (confirm('Are you sure you want to approve this artist?')) {
            // Update the artist's status to "Approved" (update in DB via backend logic)
            alert('Artist ' + artistId + ' approved!');
            location.reload(); // Refresh to reflect changes
        }
    }

    // Edit artist (mock logic)
    function editArtist(artistId) {
        // Fetch the artist's current data (mock data)
        // In real use case, fetch data via AJAX or through form fields
        const artistName = "Jane Smith";  // Example artist name
        const artistGenre = "Rock";      // Example genre
        
        document.getElementById('edit-artist-name').value = artistName;
        document.getElementById('edit-artist-genre').value = artistGenre;

        // Set form submission behavior to update artist data
        document.getElementById('edit-artist-form').onsubmit = function(e) {
            e.preventDefault();
            alert('Artist profile updated!');
            // Update artist in backend via AJAX or form submission
            $('#editArtistModal').modal('hide');
        };
    }

    // Delete artist (mock logic)
    function deleteArtist(artistId) {
        if (confirm("Are you sure you want to delete this artist?")) {
            // Delete artist from the database (you'll need a backend function for this)
            alert('Artist ' + artistId + ' deleted!');
            location.reload(); // Refresh to reflect changes
        }
    }
</script> -->

</body>
</html>

<%@page import="java.util.Iterator"%>
<%@page import="com.pack1.ProductBean"%>
<%@page import="com.pack1.CustomerBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>View Products</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" 
          rel="stylesheet" 
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" 
          crossorigin="anonymous">
          <link rel="stylesheet" type="text/css" href="ViewCustomerProduct.css">
   
</head>
<body>

    <nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow-lg">
        <div class="container-fluid">
            <% 
                CustomerBean cb=(CustomerBean)session.getAttribute("cbean");
            %>
            <a class="navbar-brand" href="#">Hello, Mr.<%= cb.getFname() %></a>
            
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link active" href="CustomerHome.jsp">Home</a> 
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="View2">View Products</a> 
                    </li>
                    <li class="nav-item">
                        <a class="nav-link btn btn-outline-gold ms-3" href="Logout">Logout</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    
    <div class="container mt-5"> 
    
        <div id="productCarousel" class="carousel slide mb-5" data-bs-ride="carousel" data-bs-interval="3000">
            <div class="carousel-inner rounded-3 shadow-lg">
                <div class="carousel-item active">
                    <img src="https://media-ik.croma.com/prod/https://media.tatacroma.com/Croma%20Assets/CMS/LP%20Page%20Banners/2025/HP%20Rotating%20Banners/october/13102025/desktop/HP_Rotating_HP_13oct2025_9JhPhF4Td.jpg?updatedAt=1760090284512" class="d-block w-100" alt="Electronics Sale"> 
                    <div class="carousel-caption d-none d-md-block bg-dark bg-opacity-75 p-2 rounded">
                        <h5> Flash Sale on All Items!</h5>
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="https://media-ik.croma.com/prod/https://media.tatacroma.com/Croma%20Assets/CMS/LP%20Page%20Banners/2025/HP%20Rotating%20Banners/october/13102025/desktop/HP_Rotating_oppo_13oct2025_jymMC2u_h.jpg?updatedAt=1760090284723" class="d-block w-100" alt="New Arrivals">
                    <div class="carousel-caption d-none d-md-block bg-dark bg-opacity-75 p-2 rounded">
                        <h5> Top Brands, Low Prices!</h5>
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="https://media-ik.croma.com/prod/https://media.tatacroma.com/Croma%20Assets/CMS/LP%20Page%20Banners/2025/Banner%20Changes/Oct/14102025/HP_Rotating_Oneplus13R_14Oct2025_iuYuOgHpE.jpg?updatedAt=1760425273458" class="d-block w-100" alt="New Arrivals">
                    <div class="carousel-caption d-none d-md-block bg-dark bg-opacity-75 p-2 rounded">
                        <h5> Designer looks, Discount prices!</h5>
                    </div>
                </div>
              
            </div>
        </div>

        <h2 class="text-center mb-4 main-heading" style="background-color: rgba(0, 0, 0, 0.6); color: #e0c865;">
            Available Products
        </h2>
        
        <div class="row row-cols-1 row-cols-md-3 row-cols-lg-4 g-4 pb-5">
        
        <%
            ArrayList<ProductBean> al=(ArrayList<ProductBean>)session.getAttribute("productList");
            
            if(al == null || al.size() == 0)
            {
                out.println("<div class='col-12'><div class='alert alert-warning text-center' role='alert'>Products are NOT available! 😔</div></div>");
            }
            else
            {
                Iterator<ProductBean> i=al.iterator();
                while(i.hasNext())
                {
                    ProductBean pb=i.next();
                    String imagePath = "images/default.jpg"; 
                    
                    String pCode = pb.getpCode();
                    
                    if("p105".equals(pCode)) {
                        imagePath = "https://in-media.apjonlinecdn.com/wysiwyg/premium-laptops/spectre-x360/tab1_spectre_x360_hero_tcm245_2380116_tcm245_2349142_tcm245-2380116.jpg";
                    } else if ("p101".equals(pCode)) {
                        imagePath = "https://tse3.mm.bing.net/th/id/OIP.wt4sgcqDKzVMven6pT0rDwHaDz?pid=Api&P=0&h=180";
                    } else if ("p104".equals(pCode)) {
                        imagePath = "https://img.freepik.com/premium-photo/sony-wireless-headphones_825767-65087.jpg";
                    } else if ("p106".equals(pCode)) {
                        imagePath = "https://img.freepik.com/premium-photo/closeup-air-purifier-with-view-room-visible-background_124507-157200.jpg";
                    } else if ("p102".equals(pCode)) {
                        imagePath = "https://img.freepik.com/premium-psd/smartphone-mock-up-with-flip-design_23-2149915868.jpg?semt=ais_hybrid";
                    } else if ("p103".equals(pCode)) {
                        imagePath = "https://tse2.mm.bing.net/th/id/OIP.fRPn8mzKZcflK_o7ThlnzgHaEK?pid=Api&P=0&h=180";
                    } else {
                        imagePath = "images/product_generic.jpg";
                    }
                    
                    int productQuantity = 0;
                    try {
                        productQuantity = Integer.parseInt(pb.getpQty().trim());
                    } catch (NumberFormatException e) {
                        productQuantity = 0; 
                    }
        %>
            <div class="col">
                <div class="card h-100 product-card">
                    <img src="<%= imagePath %>" class="card-img-top" alt="<%= pb.getpName() %>">
                    
                    <div class="card-body d-flex flex-column">
                        <h5 class="card-title text-truncate"><%= pb.getpName() %></h5>
                        <p class="card-text mb-1">
                            <small class="text-muted"><%= pb.getpCompany() %></small>
                        </p>
                        
                        <h4 class="text-success fw-bold mt-2 mb-3">
                            &#8377; <%= pb.getpPrice() %>
                        </h4>
                        <p class="card-text">
                            Quantity: 
                            <span class="badge bg-<%= productQuantity > 0 ? "success" : "danger" %>">
                                <%= pb.getpQty() %> </span>
                        </p>
                        
                        <div class="mt-auto">
                            <% if(productQuantity > 0) { %>
                                <a href='buy?pcode=<%= pb.getpCode() %>' class="btn btn-gold w-100">
                                    Buy Now
                                </a>
                            <% } else { %>
                                <button class="btn btn-secondary w-100" disabled>Out of Stock</button>
                            <% } %>
                        </div>
                    </div>
                </div>
            </div>
        <%
                }
            }
        %>
        </div> 
    </div>

    <footer class="footer mt-auto py-3 bg-dark border-top">
        <div class="container text-center">
            <span class="text-muted"> E-Commerce Portal. All Rights Reserved.</span>
            <p>Designed By RDX :)</p>
        </div>
    </footer>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" 
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" 
            crossorigin="anonymous">
    </script>
</body>
</html>

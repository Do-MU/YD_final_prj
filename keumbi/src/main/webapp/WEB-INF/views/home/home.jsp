<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
<style>
	#banner{
		border-radius: 20px;
	}
</style>
</head>
<body>
	<section class="banner_area">
		<div class="container box_1620">
			<div class="banner_inner">
				<img src="${pageContext.request.contextPath}/resources/img/banner.png" alt="" id="banner">
			</div>
		</div>
	</section>

	<section class="welcome_area p_120">
		<div class="container">
			<div class="row welcome_inner">
				<div class="col-lg-6">
					<div class="welcome_text">
						<h4>About Myself</h4>
						<p>inappropriate behavior is often laughed off as “boys will
							be boys,” women face higher conduct standards especially in the
							workplace. That’s why it’s crucial that, as women, our behavior
							on the job is beyond reproach. inappropriate behavior is often
							laughed.</p>
						<div class="row">
							<div class="col-md-4">
								<div class="wel_item">
									<i class="lnr lnr-database"></i>
									<h4>$2.5M</h4>
									<p>Total Donation</p>
								</div>
							</div>
							<div class="col-md-4">
								<div class="wel_item">
									<i class="lnr lnr-book"></i>
									<h4>1465</h4>
									<p>Total Projects</p>
								</div>
							</div>
							<div class="col-md-4">
								<div class="wel_item">
									<i class="lnr lnr-users"></i>
									<h4>3965</h4>
									<p>Total Volunteers</p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="tools_expert">
						<div class="skill_main">
							<div class="skill_item">
								<h4>
									After Effects <span class="counter">85</span>%
								</h4>
								<div class="progress_br">
									<div class="progress">
										<div class="progress-bar" role="progressbar"
											aria-valuenow="85" aria-valuemin="0" aria-valuemax="100"></div>
									</div>
								</div>
							</div>
							<div class="skill_item">
								<h4>
									Photoshop <span class="counter">90</span>%
								</h4>
								<div class="progress_br">
									<div class="progress">
										<div class="progress-bar" role="progressbar"
											aria-valuenow="90" aria-valuemin="0" aria-valuemax="100"></div>
									</div>
								</div>
							</div>
							<div class="skill_item">
								<h4>
									Illustrator <span class="counter">70</span>%
								</h4>
								<div class="progress_br">
									<div class="progress">
										<div class="progress-bar" role="progressbar"
											aria-valuenow="70" aria-valuemin="0" aria-valuemax="100"></div>
									</div>
								</div>
							</div>
							<div class="skill_item">
								<h4>
									Sublime <span class="counter">95</span>%
								</h4>
								<div class="progress_br">
									<div class="progress">
										<div class="progress-bar" role="progressbar"
											aria-valuenow="95" aria-valuemin="0" aria-valuemax="100"></div>
									</div>
								</div>
							</div>
							<div class="skill_item">
								<h4>
									Sketch <span class="counter">75</span>%
								</h4>
								<div class="progress_br">
									<div class="progress">
										<div class="progress-bar" role="progressbar"
											aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>


	<section class="feature_area p_120">
		<div class="container">
			<div class="main_title">
				<h2>KEUMBI는 이런것도 할수있어요</h2>
				<p>나랑 맞는 금융상품은 뭘까? 이 상품은 이자가 어떻게되지?<br>빠르고 쉽게 KEUMBI가 알려줄수있어요</p>
			</div>
			<div class="feature_inner row">
				<div class="col-lg-4 col-md-6">
					<div class="feature_item">
						<i class="flaticon-city"></i>
						<h4>금융상품추천</h4>
						<p>다른사람은 어떤 금융상품을 사용할까? <br>사용자의 생년월일을 기반으로 추천해드려요! <br>이자계산기까지있으니 돈계산도 끄떡없다구요</p>
					</div>
				</div>
				<div class="col-lg-4 col-md-6">
					<div class="feature_item">
						<i class="flaticon-skyline"></i>
						<h4>가계부</h4>
						<p>거래/이체/결제내역까지 가계부는 금비가쓸테니 걱정마세요! 당일 지출내역부터 당월 총 지출액까지!</p>
					</div>
				</div>
				<div class="col-lg-4 col-md-6">
					<div class="feature_item">
						<i class="flaticon-sketch"></i>
						<h4>챌린지</h4>
						<p>소비가 많은 사용자를 위해 지출을 줄일수있는 챌린지가 있어요! 첫 시작이 어렵지만 막상 시작하면 할만할껄요? <br>우리같이 소비를 줄여보자구요</p>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="home_gallery_area p_120">
		<div class="container">
			<div class="main_title">
				<h2>Our Latest Featured Projects</h2>
				<p>Who are in extremely love with eco friendly system.</p>
			</div>
			<div class="isotope_fillter">
				<ul class="gallery_filter list">
					<li class="active" data-filter="*"><a href="#">All</a></li>
					<li data-filter=".brand"><a href="#">Vector</a></li>
					<li data-filter=".manipul"><a href="#">Raster</a></li>
					<li data-filter=".creative"><a href="#">UI/UX</a></li>
					<li data-filter=".design"><a href="#">Printing</a></li>
				</ul>
			</div>
		</div>
		<div class="container">
			<div class="gallery_f_inner row imageGallery1">
				<div class="col-lg-4 col-md-4 col-sm-6 brand manipul design print">
					<div class="h_gallery_item">
						<div class="g_img_item">
							<img class="img-fluid"
								src="${pageContext.request.contextPath}/resources/img/gallery/project-1.jpg"
								alt=""> <a class="light"
								href="${pageContext.request.contextPath}/resources/img/gallery/project-1.jpg"><img
								src="${pageContext.request.contextPath}/resources/img/gallery/icon.png"
								alt=""></a>
						</div>
						<div class="g_item_text">
							<h4>3D Helmet Design</h4>
							<p>Client Project</p>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-4 col-sm-6 brand manipul creative">
					<div class="h_gallery_item">
						<div class="g_img_item">
							<img class="img-fluid"
								src="${pageContext.request.contextPath}/resources/img/gallery/project-2.jpg"
								alt=""> <a class="light"
								href="${pageContext.request.contextPath}/resources/img/gallery/project-2.jpg"><img
								src="${pageContext.request.contextPath}/resources/img/gallery/icon.png"
								alt=""></a>
						</div>
						<div class="g_item_text">
							<h4>2D Vinyl Design</h4>
							<p>Client Project</p>
						</div>
					</div>
				</div>
				<div
					class="col-lg-4 col-md-4 col-sm-6 manipul creative design print">
					<div class="h_gallery_item">
						<div class="g_img_item">
							<img class="img-fluid"
								src="${pageContext.request.contextPath}/resources/img/gallery/project-3.jpg"
								alt=""> <a class="light"
								href="${pageContext.request.contextPath}/resources/img/gallery/project-3.jpg"><img
								src="${pageContext.request.contextPath}/resources/img/gallery/icon.png"
								alt=""></a>
						</div>
						<div class="g_item_text">
							<h4>Creative Poster Design</h4>
							<p>Client Project</p>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-4 col-sm-6 brand creative print">
					<div class="h_gallery_item">
						<div class="g_img_item">
							<img class="img-fluid"
								src="${pageContext.request.contextPath}/resources/img/gallery/project-4.jpg"
								alt=""> <a class="light"
								href="${pageContext.request.contextPath}/resources/img/gallery/project-4.jpg"><img
								src="${pageContext.request.contextPath}/resources/img/gallery/icon.png"
								alt=""></a>
						</div>
						<div class="g_item_text">
							<h4>Embosed Logo Design</h4>
							<p>Client Project</p>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-4 col-sm-6 brand manipul design">
					<div class="h_gallery_item">
						<div class="g_img_item">
							<img class="img-fluid"
								src="${pageContext.request.contextPath}/resources/img/gallery/project-5.jpg"
								alt=""> <a class="light"
								href="${pageContext.request.contextPath}/resources/img/gallery/project-5.jpg"><img
								src="${pageContext.request.contextPath}/resources/img/gallery/icon.png"
								alt=""></a>
						</div>
						<div class="g_item_text">
							<h4>3D Disposable Bottle</h4>
							<p>Client Project</p>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-4 col-sm-6 brand creative">
					<div class="h_gallery_item">
						<div class="g_img_item">
							<img class="img-fluid"
								src="${pageContext.request.contextPath}/resources/img/gallery/project-6.jpg"
								alt=""> <a class="light"
								href="${pageContext.request.contextPath}/resources/img/gallery/project-6.jpg"><img
								src="${pageContext.request.contextPath}/resources/img/gallery/icon.png"
								alt=""></a>
						</div>
						<div class="g_item_text">
							<h4>3D Logo Design</h4>
							<p>Client Project</p>
						</div>
					</div>
				</div>
			</div>
			<div class="more_btn">
				<a class="main_btn" href="#">Load More Items</a>
			</div>
		</div>
	</section>

	<section class="testimonials_area p_120">
		<div class="container">
			<div class="main_title">
				<h2>Testimonials</h2>
				<p>If you are looking at blank cassettes on the web, you may be
					very confused at the difference in price. You may see some for as
					low as $.17 each.</p>
			</div>
			<div class="testi_inner">
				<div class="testi_slider owl-carousel">
					<div class="item">
						<div class="testi_item">
							<p>As conscious traveling Paup ers we must always be oncerned
								about our dear Mother Earth. If you think about it, you travel
								across her face</p>
							<h4>Fanny Spencer</h4>
							<a href="#"><i class="fa fa-star"></i></a> <a href="#"><i
								class="fa fa-star"></i></a> <a href="#"><i class="fa fa-star"></i></a>
							<a href="#"><i class="fa fa-star"></i></a> <a href="#"><i
								class="fa fa-star-half-o"></i></a>
						</div>
					</div>
					<div class="item">
						<div class="testi_item">
							<p>As conscious traveling Paup ers we must always be oncerned
								about our dear Mother Earth. If you think about it, you travel
								across her face</p>
							<h4>Fanny Spencer</h4>
							<a href="#"><i class="fa fa-star"></i></a> <a href="#"><i
								class="fa fa-star"></i></a> <a href="#"><i class="fa fa-star"></i></a>
							<a href="#"><i class="fa fa-star"></i></a> <a href="#"><i
								class="fa fa-star-half-o"></i></a>
						</div>
					</div>
					<div class="item">
						<div class="testi_item">
							<p>As conscious traveling Paup ers we must always be oncerned
								about our dear Mother Earth. If you think about it, you travel
								across her face</p>
							<h4>Fanny Spencer</h4>
							<a href="#"><i class="fa fa-star"></i></a> <a href="#"><i
								class="fa fa-star"></i></a> <a href="#"><i class="fa fa-star"></i></a>
							<a href="#"><i class="fa fa-star"></i></a> <a href="#"><i
								class="fa fa-star-half-o"></i></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
<style>
#banner{
	border-radius: 20px;
}
.feature_item{
	padding: 30px 30px;
    border-radius: 10px;
    transition: all 300ms linear 0s;
    background: #fff;
    margin-bottom: 30px;
    box-shadow: 0px 20px 80px 0px #eeeeee;
    height: 350px;
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
	${countPrd }
	<section class="welcome_area p_120">
		<div class="container">
			<div class="row welcome_inner">
				<div class="col-lg-6">
					<div class="welcome_text">
						<h4>KEUMBI INFORMATION</h4>
						<p>바쁜 현대사회 퇴근하면 은행업무는 종료 
						<br>금융과 자산관리는 어떻게 해야될까?
						<br>이번달 지출이 너무많은데 어떻게 관리해야하지?
						<br>여러은행과 카드사 수십 수백의 상품을 소비에 맞게 추천해드립니다!
						<br>나와 가장 알맞는 금융상품은 무엇인지 <span style="color:red">금비</span>를통해 확인하세요</p>
						<div class="row">
							<div class="col-md-4">
								<div class="wel_item">
									<i class="bi bi-bank"></i>
									<h4>${cntFinance.cntfinance}</h4>
									<p>금융 상품</p>
								</div>
							</div>
							<div class="col-md-4">
								<div class="wel_item">
									<i class="bi bi-credit-card"></i>
									<h4>${cntPrd.cntcard }</h4>
									<p>카드 상품</p>
								</div>
							</div>
							<div class="col-md-4">
								<div class="wel_item">
									<i class="bi bi-card-checklist"></i>
									<h4>${cntPrd.cntchal}</h4>
									<p>챌린지 수</p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="tools_expert">
						<div class="skill_main">
							<div class="skill_item">
								<h4>20대사용자 <span class="counter">${cntUser.twenty}</span>%</h4>
								<div class="progress_br">
									<div class="progress">
										<div class="progress-bar" role="progressbar" aria-valuenow="${cntUser.twenty}" aria-valuemin="0" aria-valuemax="100"></div>
									</div>
								</div>
							</div>
							<div class="skill_item">
								<h4>30대사용자 <span class="counter">${cntUser.thirty}</span>%</h4>
								<div class="progress_br">
									<div class="progress">
										<div class="progress-bar" role="progressbar" aria-valuenow="${cntUser.thirty}" aria-valuemin="0" aria-valuemax="100"></div>
									</div>
								</div>
							</div>
							<div class="skill_item">
								<h4>40대사용자 <span class="counter">${cntUser.fourty}</span>%</h4>
								<div class="progress_br">
									<div class="progress">
										<div class="progress-bar" role="progressbar" aria-valuenow="${cntUser.fourty}" aria-valuemin="0" aria-valuemax="100"></div>
									</div>
								</div>
							</div>
							<div class="skill_item">
								<h4>50대사용자 <span class="counter">${cntUser.fifty}</span>%</h4>
								<div class="progress_br">
									<div class="progress">
										<div class="progress-bar" role="progressbar" aria-valuenow="${cntUser.fifty}" aria-valuemin="0" aria-valuemax="100"></div>
									</div>
								</div>
							</div>
							<div class="skill_item">
								<h4>60대이상 <span class="counter">${cntUser.over}</span>%</h4>
								<div class="progress_br">
									<div class="progress">
										<div class="progress-bar" role="progressbar" aria-valuenow="${cntUser.over}" aria-valuemin="0" aria-valuemax="100"></div>
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
						<i class="bi bi-bank"></i>
						<h4>금융상품추천</h4>
						<p>다른사람은 어떤 금융상품을 사용할까? <br>사용자의 정보를 기반으로 추천해드려요! <br>계산기도 있어서 이자계산도 끄떡없다구요</p>
					</div>
				</div>
				<div class="col-lg-4 col-md-6">
					<div class="feature_item">
						<i class="bi bi-calendar"></i>
						<h4>가계부</h4>
						<p>거래/이체/결제내역까지 가계부는 금비가쓸테니 걱정마세요! 당일 지출내역부터 당월 총 지출액까지!</p>
					</div>
				</div>
				<div class="col-lg-4 col-md-6">
					<div class="feature_item">
						<i class="bi bi-card-checklist"></i>
						<h4>챌린지</h4>
						<p>소비가 많은 사용자를 위해 <br>지출을 줄일수있는 챌린지가 있어요! <br>시작이 어렵지만 도전하면 할만할껄요? <br>우리같이 소비를 줄여보자구요</p>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="testimonials_area p_120">
		<div class="container">
			<div class="main_title">
				<h2>금비가 처음이신가요?</h2>
				<p>금비는 사용자의 데이터를 기반으로 금융상품을 추천하고있습니다. <br>회원들의 데이터를 종합하여 금융상품을 추천하는 금비 <br>지금바로 시작하세요</p>
			</div>
			<div class="testi_inner">
				<div class="testi_slider owl-carousel">
					<div class="item">
						<div class="testi_item">
							<p>금융상품을 쉽게 비교하고 이자까지 계산되니까 간편하고 좋네요! 챌린지까지 할수있어서 절약도 되는것같아요</p>
							<h4>rks*****</h4>
							<a href="#"><i class="fa fa-star"></i></a> <a href="#"><i
								class="fa fa-star"></i></a> <a href="#"><i class="fa fa-star"></i></a>
							<a href="#"><i class="fa fa-star"></i></a> <a href="#"><i
								class="fa fa-star"></i></a>
						</div>
					</div>
					<div class="item">
						<div class="testi_item">
							<p>가계부없이 돈을 썼었는데 자동으로 기입되니 어디에 많이썼는지 보이고 절약도 되는것같아서 괜찮네요</p>
							<h4>min*****</h4>
							<a href="#"><i class="fa fa-star"></i></a> <a href="#"><i
								class="fa fa-star"></i></a> <a href="#"><i class="fa fa-star"></i></a>
							<a href="#"><i class="fa fa-star"></i></a> <a href="#"><i
								class="fa fa-star"></i></a>
						</div>
					</div>
					<div class="item">
						<div class="testi_item">
							<p>챌린지가 진짜 대박대박 저 이거하고 돈 엄청 아꼈잖아요 돈모아서 여행갈거에요! 가계부도 짱!</p>
							<h4>iam*****</h4>
							<a href="#"><i class="fa fa-star"></i></a> <a href="#"><i
								class="fa fa-star"></i></a> <a href="#"><i class="fa fa-star"></i></a>
							<a href="#"><i class="fa fa-star"></i></a> <a href="#"><i
								class="fa fa-star"></i></a>
						</div>
					</div>
					<div class="item">
						<div class="testi_item">
							<p>요즘 바빠서 은행갈시간도 없었는데 알아보기도 쉽고 간편해서 좋습니다. 근데 카드는 이게 다인가요?</p>
							<h4>par*****</h4>
							<a href="#"><i class="fa fa-star"></i></a> <a href="#"><i
								class="fa fa-star"></i></a> <a href="#"><i class="fa fa-star"></i></a>
							<a href="#"><i class="fa fa-star"></i></a> <a href="#"><i
								class="fa fa-star-o"></i></a>
						</div>
					</div>
					<div class="item">
						<div class="testi_item">
							<p>통장추천은 괜찮은데 카드수가 많이없네요 그래도 추천은 내 지출이랑 맞아서 괜찮은것같아요 </p>
							<h4>hyo*****</h4>
							<a href="#"><i class="fa fa-star"></i></a> <a href="#"><i
								class="fa fa-star"></i></a> <a href="#"><i class="fa fa-star"></i></a>
							<a href="#"><i class="fa fa-star"></i></a> <a href="#"><i
								class="fa fa-star"></i></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>

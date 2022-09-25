<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.*,fourth.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>課程列表</title>
</head>
<body>
<jsp:include page="Header.jsp"/>
<body class="productsgrid-page">

    <div class="header-device-mobile">
        <div class="wapper">
            <div class="item mobile-logo">
                <div class="logo"><a href="#"><img src="assets/images/logo.png" alt="img"></a></div>
            </div>
            <div class="item item mobile-search-box has-sub"><a href="#"><span class="icon"><i class="fa fa-search"
                            aria-hidden="true"></i></span></a>
                <div class="block-sub"><a href="#" class="close"><i class="fa fa-times" aria-hidden="true"></i></a>
                    <div class="header-searchform-box">
                        <form class="header-searchform">
                            <div class="searchform-wrap"><input type="text" class="search-input"
                                    placeholder="Enter keywords to search..."><input type="submit" class="submit button"
                                    value="Search"></div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="item mobile-settings-box has-sub"><a href="#"><span class="icon"><i class="fa fa-cog"
                            aria-hidden="true"></i></span></a>
                <div class="block-sub"><a href="#" class="close"><i class="fa fa-times" aria-hidden="true"></i></a>
                    <div class="block-sub-item">
                        <h5 class="block-item-title">Currency</h5>
                        <form class="currency-form teamo-language">
                            <ul class="teamo-language-wrap">
                                <li class="active"><a href="#"><span>English(USD) </span></a></li>
                                <li><a href="#"><span>French(EUR) </span></a></li>
                                <li><a href="#"><span>Japanese(JPY) </span></a></li>
                            </ul>
                        </form>
                    </div>
                </div>
            </div>
            <div class="item menu-bar"><a class=" mobile-navigation  menu-toggle"
                    href="#"><span></span><span></span><span></span></a></div>
        </div>
    </div>
    <div class="main-content main-content-product left-sidebar">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-trail breadcrumbs">
<!--                         <ul class="trail-items breadcrumb"> -->
<!--                             <li class="trail-item trail-begin"><a href="Index">首頁</a></li> -->
<!--                             <li class="trail-item trail-end active">課程列表 </li> -->
<!--                         </ul> -->
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="content-area shop-grid-content no-banner col-lg-9 col-md-9 col-sm-12 col-xs-12">
                    <div class="site-main">
                        <h3 class="custom_blog_title">所有課程 </h3>
                        <div class="shop-top-control">
                            <form class="select-item select-form"><span class="title">Sort</span><select title="sort"
                                    data-placeholder="12 Products/Page" class="chosen-select">
                                    <option value="1">12 Products/Page</option>
                                    <option value="2">9 Products/Page</option>
                                    <option value="3">10 Products/Page</option>
                                    <option value="4">8 Products/Page</option>
                                    <option value="5">6 Products/Page</option>
                                </select></form>
                            <form class="filter-choice select-form">s <span class="title">Sort by</span><select
                                    title="sort-by" data-placeholder="Price: Low to High" class="chosen-select">
                                    <option value="1">Price:Low to High</option>
                                    <option value="2">Sort by popularity</option>
                                    <option value="3">Sort by average rating</option>
                                    <option value="4">Sort by newness</option>
                                    <option value="5">Sort by price:low to high</option>
                                </select></form>
                            <div class="grid-view-mode">
                                <div class="inner"><a href="coursefront2.list"
                                        class="modes-mode mode-list"><span></span><span></span></a><a
                                        href="coursefront1.list"
                                        class="modes-mode mode-grid  active"><span></span><span></span><span></span><span></span></a>
                                </div>
                            </div>
                        </div>
                        
                        <ul class="row list-products auto-clear equal-container product-grid">
                        <c:forEach var="course" items="${list}">
<%-- 								 <input type="hidden" name="course_id" value='<c:out value="${course.course_id}"/>'> --%>
									<li
									class="product-item product-type-variable col-lg-4 col-md-6 col-sm-6 col-xs-6 col-ts-12 style-1">
										<div class="product-inner equal-element">
											<div class="product-top"></div>
											<div class="product-thumb">
												<div class="thumb-inner">
													<a href="coursefront.details?course_id=${course.course_id}"><img
														src="<c:out value="${course.course_picture}" />" alt="img"></a>
													<div class="thumb-group"></div>
												</div>
											</div>
											<div class="product-info">
												<h5 class="product-name product_title">
													<a href="coursefront.details?course_id=${course.course_id}"><c:out value="${course.course_name}" /></a>
												</h5>
												<div class="group-info">
													<div class="stars-rating">
														<div class="star-rating">
															<span class="star-3"></span>
														</div>
														<div class="count-star">(3)</div>
													</div>
													<div class="price">
														<ins>
															$
															<c:out value="${course.course_price}" />
														</ins>
													</div>
													<br>
														<a href=""><button>加入購物車</button></a>

												</div>
											</div>
										</div>
								</li>

								
							</c:forEach>
                        </ul>
                        
<!--                         <div class="pagination clearfix style3"> -->
<!--                             <div class="nav-link"><a href="#" class="page-numbers"><i class="icon fa fa-angle-left" -->
<!--                                         aria-hidden="true"></i></a><a href="#" class="page-numbers">1</a><a href="#" -->
<!--                                     class="page-numbers">2</a><a href="#" class="page-numbers current">3</a><a href="#" -->
<!--                                     class="page-numbers"><i class="icon fa fa-angle-right" aria-hidden="true"></i></a> -->
<!--                             </div> -->
<!--                         </div> -->
                    </div>
                </div>
                
                <div class="sidebar col-lg-3 col-md-3 col-sm-12 col-xs-12">
                    <div class="wrapper-sidebar shop-sidebar">
                        <div class="widget woof_Widget">
                            <div class="widget widget-categories">
                                <h3 class="widgettitle">課程分類</h3>
                                <ul class="list-categories">
                                    <li><input type="checkbox" id="cb1"><label for="cb1" class="label-text">英文
                                        </label></li>
                                    <li><input type="checkbox" id="cb2"><label for="cb2" class="label-text">數學
                                        </label></li>
                                    <li><input type="checkbox" id="cb3"><label for="cb3" class="label-text">多益
                                        </label></li>

                                </ul>
                            </div>
                            <div class="widget widget_filter_price">
                                <h4 class="widgettitle">課程價格 </h4>
                                <div class="price-slider-wrapper">
                                    <div data-label-reasult="Range:" data-min="0" data-max="3000" data-unit="$"
                                        class="slider-range-price " data-value-min="0" data-value-max="1000"></div>
                                    <div class="price-slider-amount"><span class="from">$0</span><span
                                            class="to">$200</span></div>
                                </div>
                            </div>
                            <div class="widget widget-brand">
                                <h3 class="widgettitle">程度</h3>
                                <ul class="list-brand">
                                    <li><input id="cb7" type="checkbox"><label for="cb7" class="label-text">國中</label>
                                    </li>
                                    <li><input id="cb8" type="checkbox"><label for="cb8" class="label-text">高中</label>
                                    </li>
                                    <li><input id="cb9" type="checkbox"><label for="cb9" class="label-text">成人</label>
                                    </li>

                                </ul>
                            </div>


                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
<jsp:include page="Footer.jsp"/>
</body>
</html>
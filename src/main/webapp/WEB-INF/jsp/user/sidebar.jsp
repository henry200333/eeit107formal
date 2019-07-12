<style>
.sh-side-demos {
	width: 430px;
	position: fixed;
	z-index: 5000;
	top: 0;
	right: 0px;
	bottom: 0;
	transform: translateX(430px);
}

.sh-side-demos.open {
	box-shadow: 0 0px 39px 10px rgba(0, 0, 0, 0.2);
}

.sh-side-demos-container {
	top: 0;
	left: 0;
	right: -17px;
	position: absolute;
	bottom: 0;
	overflow-y: scroll;
	background-color: #fff;
	background-repeat: no-repeat;
	background-position: right top;
}

body.admin-bar .sh-side-demos-container {
	top: 32px;
}

.sh-side-demos.open {
	transform: translateX(0px);
}

@media ( max-width : 1400px) {
	.sh-side-demos {
		width: 280px;
		transform: translateX(280px);
	}
	.sh-side-demos .sh-side-demos-intro {
		max-width: none !important;
		padding: 0 25px;
		margin-bottom: 35px;
		margin-top: 35px;
	}
	.sh-side-demos .sh-side-demos-intro h2.welcome-title {
		font-size: 21px;
	}
	.sh-side-demos .sh-side-demos-intro p {
		font-size: 13px;
		margin-bottom: 20px;
	}
	.sh-side-demos .sh-side-demos-purhase {
		line-height: 44px;
		padding: 0 32px;
		font-size: 11px;
	}
	.sh-side-demos .sh-side-demos-container-close {
		top: 12px;
		right: 12px;
	}
	.sh-side-demos .sh-side-demos-loop {
		padding: 0 18px;
	}
	.sh-side-demos .sh-side-demos-item {
		padding: 0 5px;
		margin-bottom: 15px;
	}
	.sh-side-demos .sh-side-demos-item-thumbnail {
		width: 123px;
		height: 96px;
		background-size: 123px;
	}
	.sh-side-demos .sh-side-demos-item-name {
		font-size: 11px;
	}
}

@media ( max-width : 600px) {
	.sh-side-demos {
		display: none !important;
	}
}

body.admin-bar .sh-side-demos {
	padding-top: 32px;
}

.sh-side-demos-intro {
	max-width: 310px;
	display: table;
	margin: 0 auto;
	margin-top: 50px;
	margin-bottom: 45px;
	text-align: center;
}

.sh-side-demos-intro h2.welcome-title {
	color: #2f2f2f;
	margin-bottom: 19px;
	font-weight: 900;
	font-size: 24px;
	line-height: 100% !important;
}

.sh-side-demos-intro h2.welcome-title strong {
	font-weight: 900;
}

.sh-side-demos-intro p {
	color: #5b5b5b;
	font-size: 14px;
	line-height: 1.7;
	margin-bottom: 25px;
}

.sh-side-demos-purhase {
	display: table;
	padding: 0 42px;
	background-color: #44cd81;
	color: #fff !important;
	text-align: center;
	font-weight: bold;
	font-size: 12px;
	transition: 0.3s all ease-in-out;
	margin-top: 27px;
	border-radius: 100px;
	line-height: 54px;
	margin: 0 auto;
	text-transform: uppercase;
}

.sh-side-demos-purhase:hover {
	background-color: #3db874;
	color: #fff;
}

.sh-side-demos-loop {
	padding: 0px 23px 0px 23px;
}

.sh-side-demos-loop-container {
	position: relative;
	margin: 0 -10px;
}

.sh-side-demos-item {
	text-align: center;
	margin-bottom: 23px;
	width: 50%;
	display: inline-block;
	margin-right: -4px;
	padding: 0 10px;
}

.sh-side-demos-item .vcg-single-image-tag {
	width: 40px;
	height: 40px;
	z-index: 100;
}

.sh-side-demos-item .vcg-single-image-tag span {
	line-height: 42px;
	font-size: 9px;
}

.sh-side-demos-item>a>span {
	display: block;
	font-weight: bold;
	text-transform: uppercase;
	font-size: 11px;
	color: #505050;
	margin-top: 15px;
}

.sh-side-demos-item-name {
	font-weight: bold;
	margin-top: 5px;
	font-size: 12px;
	color: #2f2f2f;
}

.sh-side-demos-item-thumbnail {
	position: relative;
	width: 180px;
	height: 140px;
	margin: 0 auto;
	box-shadow: 0px 5px 20px rgba(0, 0, 0, 0.06);
	transition: 0.3s all ease-in-out;
	border-radius: 4px;
	background-image:
		url( "https://cdn.gillion.shufflehound.com/wp-content/plugins/shufflehound-showcase-framework/sidemenu/demos2.png" );
	background-repeat: no-repeat;
	border: 1px solid #efefef;
}

.sh-side-demos-item-thumbnail:hover, .sh-side-demos-item-thumbnail:focus
	{
	box-shadow: 0px 5px 20px rgba(0, 0, 0, 0.14);
}

.sh-side-demos-item-thumbnail .post-overlay {
	border-radius: 4px !important;
}

.sh-side-demos-buttons {
	position: absolute;
	top: 229px;
	left: -70px;
	width: 70px;
	border-top-left-radius: 5px;
	border-bottom-left-radius: 5px;
	box-shadow: 0 0px 25px 8px rgba(0, 0, 0, .07);
}

.sh-side-demos-pages .sh-side-demos-buttons {
	top: 160px;
}

.sh-side-options-item:first-child {
	border-top-left-radius: 5px;
}

.sh-side-options-item:last-child {
	border-bottom-left-radius: 5px;
}

.sh-side-options-item {
	display: block;
	text-align: center;
	margin: 0px;
	padding: 17px 0;
	transition: 0.3s all ease-in-out;
	position: relative;
	background-color: #fff;
	cursor: pointer;
	border-right: 1px solid #f1f1f1;
}

.sh-side-options-item:not (:last-child ) {
	border-bottom: 1px solid #f1f1f1;
}

.sh-side-options-item i {
	font-size: 24px;
}

.sh-side-options-item img {
	height: 33px;
	transition: 0.3s all ease-in-out;
}

.sh-side-options-item img.sh-side-demos-colorful {
	position: absolute;
	left: 18px;
	top: 17px;
	opacity: 0;
}

.sh-side-options-item:hover img.sh-side-demos-standard,
	.sh-side-options-item:focus img.sh-side-demos-standard, .sh-side-demos.open .sh-side-demos-button1 img.sh-side-demos-standard
	{
	opacity: 0;
}

.sh-side-options-item:hover img.sh-side-demos-colorful,
	.sh-side-options-item:focus img.sh-side-demos-colorful, .sh-side-demos.open .sh-side-demos-button1 img.sh-side-demos-colorful
	{
	opacity: 1;
}

.sh-side-options-item:not (:hover ):not (:focus ) {
	color: #B9B9B9 !important;
}

.sh-side-options-item:hover .sh-side-options-hover {
	opacity: 1;
	transform: translateX(-100%);
}

.sh-side-options-hover {
	position: absolute;
	background-color: #232323;
	color: #fff;
	padding: 20px 26px;
	transform: translateX(0%);
	left: 0px;
	top: 0;
	bottom: 0;
	opacity: 0;
	transition: 0.2s all ease-in-out;
	z-index: -100;
	font-size: 13px;
	border-top-left-radius: 5px;
	border-bottom-left-radius: 5px;
}

.sh-side-options-hover span {
	padding: 0px 3px;
}

.sh-side-demos-container-close {
	position: absolute;
	top: 22px;
	right: 22px;
	cursor: pointer;
}

.sh-side-demos-container-close i {
	color: #c5c5c5;
	font-size: 18px;
	transition: 0.3s all ease;
}

.sh-side-demos-container-close:hover i, .sh-side-demos-container-close:focus i
	{
	color: #7f7f7f;
}

img.sh-side-demos-standard {
	
}

/* Side Icons */
.sh-side-options-item-image, .sh-side-options-item-image-colorful {
	width: 33px;
	height: 33px;
	background-image:
		url( "https://cdn.gillion.shufflehound.com/wp-content/plugins/shufflehound-showcase-framework/sidemenu/sidemenu-icons.png" );
	background-repeat: no-repeat;
	background-size: 33px;
	margin: 0 auto;
	transition: .3s all ease-in-out;
}

.sh-side-options-item-image-colorful {
	position: absolute;
	left: 18px;
	top: 17px;
	opacity: 0;
}

.sh-side-options-item:hover .sh-side-options-item-image {
	opacity: 0;
}

.sh-side-options-item:hover .sh-side-options-item-image-colorful {
	opacity: 1;
}

.sh-side-demo-news {
	background-position: 0px -2240px;
}

.sh-side-demo-magazine {
	background-position: 0px -2100px;
}

.sh-side-demo-gizmo-news {
	background-position: 0px -1820px;
}

.sh-side-demo-clean {
	background-position: 0px -1960px;
}

.sh-side-demo-tech {
	background-position: 0px -1680px;
}

.sh-side-demo-foodie {
	background-position: 0px -1540px;
}

.sh-side-demo-lifestyle {
	background-position: 0px -1400px;
}

.sh-side-demo-personal {
	background-position: 0px -1260px;
}

.sh-side-demo-shop {
	background-position: 0px -980px;
}

.sh-side-demo-fashion {
	background-position: 0px -1120px;
}

.sh-side-demo-travel {
	background-position: 0px -1260px;
}

.sh-side-demo-creative {
	background-position: 0px -420px;
}

.sh-side-demo-full-width {
	background-position: 0px -140px;
}

.sh-side-demo-background {
	background-position: 0px -280px;
}

.sh-side-demo-boxed {
	background-position: 0px -560px;
}

.sh-side-demo-carousel {
	background-position: 0px -700px;
}

@media ( max-width : 1400px) {
	.sh-side-demo-news {
		background-position: 0px -1536px;
	}
	.sh-side-demo-magazine {
		background-position: 0px -1440px;
	}
	.sh-side-demo-gizmo-news {
		background-position: 0px -1248px;
	}
	.sh-side-demo-clean {
		background-position: 0px -1344px;
	}
	.sh-side-demo-tech {
		background-position: 0px -1152px;
	}
	.sh-side-demo-foodie {
		background-position: 0px -1056px;
	}
	.sh-side-demo-lifestyle {
		background-position: 0px -960px;
	}
	.sh-side-demo-personal {
		background-position: 0px -864px;
	}
	.sh-side-demo-shop {
		background-position: 0px -672px;
	}
	.sh-side-demo-fashion {
		background-position: 0px -768px;
	}
	.sh-side-demo-travel {
		background-position: 0px -864px;
	}
	.sh-side-demo-creative {
		background-position: 0px -288px;
	}
	.sh-side-demo-full-width {
		background-position: 0px -96px;
	}
	.sh-side-demo-background {
		background-position: 0px -192px;
	}
	.sh-side-demo-boxed {
		background-position: 0px -384px;
	}
	.sh-side-demo-carousel {
		background-position: 0px -480px;
	}
}

.sh-side-options-item-image-showcase {
	background-position: 0px -0px;
}

.sh-side-options-item-image-showcase-color {
	background-position: 0px -33px;
}

.sh-side-options-item-image-demos {
	background-position: 0px -66px;
}

.sh-side-options-item-image-demos-color {
	background-position: 0px -99px;
}

.sh-side-options-item-image-questions {
	background-position: 0px -132px;
}

.sh-side-options-item-image-questions-color {
	background-position: 0px -165px;
}

.sh-side-options-item-image-support {
	background-position: 0px -198px;
}

.sh-side-options-item-image-support-color {
	background-position: 0px -231px;
}

.sh-side-options-item-image-message {
	background-position: 0px -264px;
}

.sh-side-options-item-image-message-color {
	background-position: 0px -297px;
}
</style>
<div class="sh-side-demos sh-side-demos-pages">
		<div class="sh-side-demos-buttons">
			<a href=""
				class="sh-side-options-item sh-accent-color"><div
					class="sh-side-options-item-image sh-side-options-item-image-showcase"></div>
				<div
					class="sh-side-options-item-image-colorful sh-side-options-item-image-showcase-color"></div>
				<div class="sh-side-options-hover">Team</div> </a> <a
				class="sh-side-options-item sh-accent-color sh-side-demos-button1"><div
					class="sh-side-options-item-image sh-side-options-item-image-demos"></div>
				<div
					class="sh-side-options-item-image-colorful sh-side-options-item-image-demos-color"></div>
				<div class="sh-side-options-hover">Regulation</div> </a>
			<div class="sh-side-options-divider"></div>
			<a href=""
				class="sh-side-options-item sh-accent-color"><div
					class="sh-side-options-item-image sh-side-options-item-image-questions"></div>
				<div
					class="sh-side-options-item-image-colorful sh-side-options-item-image-questions-color"></div>
				<div class="sh-side-options-hover">
					Questions<span></span>/<span></span>Answers
				</div> </a>
			<div class="sh-side-options-divider"></div>
			<a target="blank" href="https://support.shufflehound.com/"
				class="sh-side-options-item sh-accent-color"><div
					class="sh-side-options-item-image sh-side-options-item-image-support"></div>
				<div
					class="sh-side-options-item-image-colorful sh-side-options-item-image-support-color"></div>
				<div class="sh-side-options-hover">
					Get<span></span>Support
				</div> </a>
			<div class="sh-side-options-divider"></div>
			<a target="blank"
				href="https://support.shufflehound.com/pre-sale-questions/"
				class="sh-side-options-item sh-accent-color"><div
					class="sh-side-options-item-image sh-side-options-item-image-message"></div>
				<div
					class="sh-side-options-item-image-colorful sh-side-options-item-image-message-color"></div>
				<div class="sh-side-options-hover" style="white-space: nowrap;">
					Ask a Pre-Sale<span></span>Question
				</div> </a>
		</div>
		<div class="sh-side-demos-container">
			<div class="sh-side-demos-container-close">
				<i class="ti-close"></i>
			</div>
			<div class="sh-side-demos-intro">
				<h2 class="welcome-title sh-heading-font">Publish with style!</h2>
				<p class="sh-heading-font">Gillion is a multi-concept WP theme
					that lets you create blog, magazine, news, review websites & even
					shop + it’s modular!</p>
				<a
					href="https://themeforest.net/item/gillion-multiconcept-blogmagazine-theme/19470306?ref=Shufflehound&license=regular&open_purchase_for_item_id=19470306&purchasable=source"
					target="blank" class="sh-side-demos-purhase sh-heading-font">Purchase
					Theme</a>
			</div>
			<div class="sh-side-demos-loop">
				<div class="sh-side-demos-loop-container">
					<div class="sh-side-demos-item">
						<div
							class="post-thumbnail sh-side-demos-item-thumbnail sh-side-demo-news">
							<a href="/news" class="post-overlay"></a>
							<div class="vcg-single-image-tag vcg-single-image-tag-new">
								<span>NEW</span>
							</div>
						</div>
						<div class="sh-side-demos-item-name">News</div>
					</div>
					<div class="sh-side-demos-item">
						<div
							class="post-thumbnail sh-side-demos-item-thumbnail sh-side-demo-magazine">
							<a href="/magazine" class="post-overlay"></a>
						</div>
						<div class="sh-side-demos-item-name">Magazine</div>
					</div>
					<div class="sh-side-demos-item">
						<div
							class="post-thumbnail sh-side-demos-item-thumbnail sh-side-demo-gizmo-news">
							<a href="/gizmo-news" class="post-overlay"></a>
						</div>
						<div class="sh-side-demos-item-name">Gizmo News</div>
					</div>
					<div class="sh-side-demos-item">
						<div
							class="post-thumbnail sh-side-demos-item-thumbnail sh-side-demo-clean">
							<a href="/clean" class="post-overlay"></a>
						</div>
						<div class="sh-side-demos-item-name">Clean</div>
					</div>
					<div class="sh-side-demos-item">
						<div
							class="post-thumbnail sh-side-demos-item-thumbnail sh-side-demo-tech">
							<a href="/tech" class="post-overlay"></a>
						</div>
						<div class="sh-side-demos-item-name">Tech</div>
					</div>
					<div class="sh-side-demos-item">
						<div
							class="post-thumbnail sh-side-demos-item-thumbnail sh-side-demo-foodie">
							<a href="/foodie" class="post-overlay"></a>
						</div>
						<div class="sh-side-demos-item-name">Foodie</div>
					</div>
					<div class="sh-side-demos-item">
						<div
							class="post-thumbnail sh-side-demos-item-thumbnail sh-side-demo-lifestyle">
							<a href="/lifestyle" class="post-overlay"></a>
						</div>
						<div class="sh-side-demos-item-name">Lifestyle</div>
					</div>
					<div class="sh-side-demos-item">
						<div
							class="post-thumbnail sh-side-demos-item-thumbnail sh-side-demo-personal">
							<a href="/personal" class="post-overlay"></a>
						</div>
						<div class="sh-side-demos-item-name">Personal</div>
					</div>
					<div class="sh-side-demos-item">
						<div
							class="post-thumbnail sh-side-demos-item-thumbnail sh-side-demo-shop">
							<a href="/shop1" class="post-overlay"></a>
						</div>
						<div class="sh-side-demos-item-name">Shop</div>
					</div>
					<div class="sh-side-demos-item">
						<div
							class="post-thumbnail sh-side-demos-item-thumbnail sh-side-demo-fashion">
							<a href="/fashion" class="post-overlay"></a>
						</div>
						<div class="sh-side-demos-item-name">Fashion</div>
					</div>
					<div class="sh-side-demos-item">
						<div
							class="post-thumbnail sh-side-demos-item-thumbnail sh-side-demo-travel">
							<a href="/travel" class="post-overlay"></a>
						</div>
						<div class="sh-side-demos-item-name">Travel</div>
					</div>
					<div class="sh-side-demos-item">
						<div
							class="post-thumbnail sh-side-demos-item-thumbnail sh-side-demo-card-style">
							<a href="/home/card-style" class="post-overlay"></a>
						</div>
						<div class="sh-side-demos-item-name">Card Style</div>
					</div>
					<div class="sh-side-demos-item">
						<div
							class="post-thumbnail sh-side-demos-item-thumbnail sh-side-demo-creative">
							<a href="/home/creative-slider" class="post-overlay"></a>
						</div>
						<div class="sh-side-demos-item-name">Creative</div>
					</div>
					<div class="sh-side-demos-item">
						<div
							class="post-thumbnail sh-side-demos-item-thumbnail sh-side-demo-full-width">
							<a href="/home/full-width-slider" class="post-overlay"></a>
						</div>
						<div class="sh-side-demos-item-name">Full Width</div>
					</div>
					<div class="sh-side-demos-item">
						<div
							class="post-thumbnail sh-side-demos-item-thumbnail sh-side-demo-background">
							<a href="/home/background-image" class="post-overlay"></a>
						</div>
						<div class="sh-side-demos-item-name">Background</div>
					</div>
					<div class="sh-side-demos-item">
						<div
							class="post-thumbnail sh-side-demos-item-thumbnail sh-side-demo-boxed">
							<a href="/home/boxed-slider" class="post-overlay"></a>
						</div>
						<div class="sh-side-demos-item-name">Boxed</div>
					</div>
					<div class="sh-side-demos-item">
						<div
							class="post-thumbnail sh-side-demos-item-thumbnail sh-side-demo-carousel">
							<a href="/home/carousel-slider" class="post-overlay"></a>
						</div>
						<div class="sh-side-demos-item-name">Carousel</div>
					</div>
				</div>
			</div>
		</div>
	</div>
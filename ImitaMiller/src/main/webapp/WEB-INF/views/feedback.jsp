<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="modal fade" id="feedbackModal" tabindex="-1"
	aria-labelledby="feedbackModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header bg-gradient-primary-to-secondary p-4">
				<h5 class="modal-title font-alt text-white" id="feedbackModalLabel">문의하기</h5>
				<button class="btn-close btn-close-white" type="button"
					data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body border-0 p-4">
				<!-- * * * * * * * * * * * * * * *-->
				<!-- * * SB Forms Contact Form * *-->
				<!-- * * * * * * * * * * * * * * *-->
				<!-- This form is pre-integrated with SB Forms.-->
				<!-- To make this form functional, sign up at-->
				<!-- https://startbootstrap.com/solution/contact-forms-->
				<!-- to get an API token!-->
				<form id="contactForm" data-sb-form-api-token="API_TOKEN">
					<!-- Name input-->
					<div class="form-floating mb-3">
						<input class="form-control" id="name" type="text"
							placeholder="Enter your name..." data-sb-validations="required" />
						<label for="name">제목</label>
						<div class="invalid-feedback" data-sb-feedback="name:required">제목을
							입력해주세요.</div>
					</div>
					<!-- Email address input-->
					<div class="form-floating mb-3">
						<input class="form-control" id="email" type="email"
							placeholder="name@example.com"
							data-sb-validations="required,email" /> <label for="email">이메일
							주소</label>
						<div class="invalid-feedback" data-sb-feedback="email:required">이메일
							주소를 입력해주세요.</div>
						<div class="invalid-feedback" data-sb-feedback="email:email">정확한
							이메일 양식으로 입력해주세요.</div>
					</div>
					<!-- Phone number input-->
					<div class="form-floating mb-3">
						<input class="form-control" id="phone" type="tel"
							placeholder="(123) 456-7890" data-sb-validations="required" /> <label
							for="phone">휴대폰 번호</label>
						<div class="invalid-feedback" data-sb-feedback="phone:required">휴대폰
							번호를 입력해주세요.</div>
					</div>
					<!-- Message input-->
					<div class="form-floating mb-3">
						<textarea class="form-control" id="message" type="text"
							placeholder="Enter your message here..." style="height: 10rem"
							data-sb-validations="required"></textarea>
						<label for="message">내용</label>
						<div class="invalid-feedback" data-sb-feedback="message:required">내용을
							입력해주세요.</div>
					</div>
					<!-- Submit success message-->
					<!---->
					<!-- This is what your users will see when the form-->
					<!-- has successfully submitted-->
					<div class="d-none" id="submitSuccessMessage">
						<div class="text-center mb-3">
							<div class="fw-bolder">문의사항이 제출되었습니다!</div>
							문의하신 내용은 시간이 걸릴 수 있습니다. <br /> <a
								href="https://startbootstrap.com/solution/contact-forms">https://startbootstrap.com/solution/contact-forms</a>
						</div>
					</div>
					<!-- Submit error message-->
					<!---->
					<!-- This is what your users will see when there is-->
					<!-- an error submitting the form-->
					<div class="d-none" id="submitErrorMessage">
						<div class="text-center text-danger mb-3">Error sending
							message!</div>
					</div>
					<!-- Submit Button-->
					<div class="d-grid">
						<button class="btn btn-primary rounded-pill btn-lg disabled"
							id="submitButton" type="submit">Submit</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
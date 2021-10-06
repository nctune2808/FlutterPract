abstract class FormSubmissionStatus {
  const FormSubmissionStatus();
}

class InitialFormStatus extends FormSubmissionStatus {
  const InitialFormStatus();
}

class FormSubmitting extends FormSubmissionStatus {}

class AdminSubmitting extends FormSubmissionStatus {}

class SubmissionSucess extends FormSubmissionStatus {}

class SubmissionFailed extends FormSubmissionStatus {
  final dynamic exception;
  SubmissionFailed({
    required this.exception,
  });
}

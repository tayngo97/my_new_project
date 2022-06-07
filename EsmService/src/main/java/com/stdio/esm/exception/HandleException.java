package com.stdio.esm.exception;
import com.stdio.esm.model.EsmResponse;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import javax.validation.ValidationException;

/**
 * @author AnhKhoa
 * @since 19/05/2022 - 11:11
 */
@RestControllerAdvice
public class HandleException {

    @ExceptionHandler(value = {ValidationException.class})
    public ResponseEntity<?> esmException(Exception exception) {
        String [] temp = exception.getMessage().split("\\s++");
        String error = exception.getMessage().substring(temp[0].length()+1);
        EsmResponse esmResponse = new EsmResponse();
        esmResponse.setStatus(EsmResponse.ERROR);
        esmResponse.setMessage(error);
        esmResponse.setResponseData(null);
        return ResponseEntity.ok(esmResponse);
    }
}

package com.stdio.esm.controller;


import com.stdio.esm.model.EsmResponse;
import com.stdio.esm.service.SecurityService;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.constraints.NotBlank;
import java.util.Map;

/**
 * @author AnhKhoa
 * @since 19/05/2022 - 11:11
 */

@RestController
@RequestMapping(path = "/api/public")
@Validated
public class AuthController {

    @Autowired
    private SecurityService securityService;

    @Autowired
    private MessageSource messageSource;

    /**
     * Login with username and password
     *{}
     * @param username {@link String}
     * @param password {@link String}
     * @return {@link ResponseEntity<Map<String,Object>>}
     */

    @PostMapping(value = "/login")
    @ApiOperation(value = "LOGIN")
    public ResponseEntity<Map<String,Object>> login( @NotBlank(message = "{message.error.login.username}") @RequestParam(name  = "username") String username,
                                                     @NotBlank(message = "{message.error.login.password}") @RequestParam(name = "password") String password){
        EsmResponse esmResponse = new EsmResponse();
        try {
            Map<String,Object> responseData = securityService.login(username,password);
            esmResponse.setStatus(EsmResponse.SUCCESS);
            esmResponse.setMessage(messageSource.getMessage("message.success.login", null, "DefaultTitle", null));
            esmResponse.setResponseData(responseData);
        } catch (RuntimeException runtimeException) {
            esmResponse.setStatus(EsmResponse.ERROR);
            esmResponse.setMessage(runtimeException.getMessage());
            esmResponse.setResponseData(null);
        } catch (Exception exception){
            esmResponse.setStatus(EsmResponse.ERROR);
            esmResponse.setMessage(exception.getMessage());
            esmResponse.setResponseData(null);
        }
        ResponseEntity<Map<String,Object>> response = ResponseEntity.status(HttpStatus.OK).body(esmResponse.getResponse());
        return response;
    }

    /**
     * Get new access token from refresh token
     *
     * @param request refreshToken {@link String}
     * @return {@link ResponseEntity<Map<String,Object>>}
     */
    @PostMapping("/refresh-token")
    @ApiOperation(value = "GET NEW ACCESS TOKEN")
    public ResponseEntity<String> refreshToken(@NotBlank @RequestParam(name = "refreshToken") String request){

        String responseData = securityService.getNewAccessTokenFromRefreshToken(request);
        ResponseEntity<String> response = ResponseEntity.status(HttpStatus.OK).body(responseData);
        return response;
    }


}

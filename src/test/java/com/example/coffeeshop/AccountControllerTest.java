package com.example.coffeeshop;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.test.context.support.WithUserDetails;
import org.springframework.test.context.TestPropertySource;
import org.springframework.test.context.jdbc.Sql;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockHttpServletRequestBuilder;

import static org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestPostProcessors.csrf;
import static org.springframework.security.test.web.servlet.response.SecurityMockMvcResultMatchers.authenticated;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.multipart;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.xpath;

@RunWith(SpringRunner.class)
@SpringBootTest
@AutoConfigureMockMvc
@TestPropertySource("/application-test.properties")
@Sql(value = {"/create-user-before.sql"}, executionPhase = Sql.ExecutionPhase.BEFORE_TEST_METHOD)
@Sql(value = {"/create-user-after.sql"}, executionPhase = Sql.ExecutionPhase.AFTER_TEST_METHOD)
public class AccountControllerTest {

    @Autowired
    private MockMvc mockMvc;

    @Test
    @WithUserDetails("vlad")
    public void accountInformationTest() throws Exception {
        this.mockMvc.perform(get("/account/information"))
                .andDo(print())
                .andExpect(authenticated())
                .andExpect(xpath("/html/body/header/main/div[2]/table/thead/tr[1]/td[2]").string("firstname"))
                .andExpect(xpath("/html/body/header/main/div[2]/table/thead/tr[2]/td[2]").string("lastname"))
                .andExpect(xpath("/html/body/header/main/div[2]/table/thead/tr[3]/td[2]").string("patronymic"))
                .andExpect(xpath("/html/body/header/main/div[2]/table/thead/tr[5]/td[2]").string("0661234567"))
                .andExpect(xpath("/html/body/header/main/div[2]/table/thead/tr[4]/td[2]").string("vlad@gmail.com"))
                .andExpect(xpath("/html/body/header/main/div[2]/table/thead/tr[6]/td[2]").string("Kiev"))
                .andExpect(xpath("/html/body/header/main/div[2]/table/thead/tr[7]/td[2]").string("58"));
    }

    @Test
    @WithUserDetails("admin")
    public void addProductTest() throws Exception {
        MockHttpServletRequestBuilder multipart = multipart("/account/productList/newProduct")
        .file("file", "123".getBytes())
        .param("productName", "Pelican")
        .param("price", "123")
        .param("discount", "0")
        .param("number", "23")
        .param("specification", "60% Арабика, 40% Робуста ")
        .param("category", "COFFEE")
        .param("section", "GRAINS")
        .with(csrf());

        this.mockMvc.perform(multipart)
                .andDo(print())
                .andExpect(authenticated())
                ;
    }
}

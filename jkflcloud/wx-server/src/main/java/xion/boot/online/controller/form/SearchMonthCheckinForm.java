package xion.boot.online.controller.form;

import io.swagger.annotations.ApiModel;
import lombok.Data;
import org.hibernate.validator.constraints.Range;

import javax.validation.constraints.NotNull;

@Data
@ApiModel
public class SearchMonthCheckinForm {
    @NotNull
    @Range(min=2021,max = 2023)
    private Integer year;

    @NotNull
    @Range(min=1,max = 12)
    private Integer month;
}

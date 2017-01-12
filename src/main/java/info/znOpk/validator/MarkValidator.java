package info.znOpk.validator;

import info.znOpk.model.User;
import info.znOpk.repository.MarkRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * Created by DuduŚ on 2017-01-11.
 */

@Component
public class MarkValidator {

    @Autowired
    private MarkRepository markRepository;

    public void addMark(String mark, Long id){

        User user = markRepository.getUserById(id);
        markRepository.updateMark(evaluateAverage(mark,user.getMark(),user.getMark_quantity()),(user.getMark_quantity()+1),id);

    }

    private String evaluateAverage(String mark, String average, int quantity){

        Double newMark = Double.parseDouble(mark);
        Double oldMark = Double.parseDouble(average);

        return String.valueOf((oldMark*quantity+newMark)/(quantity+1)).substring(0,3);
    }
}

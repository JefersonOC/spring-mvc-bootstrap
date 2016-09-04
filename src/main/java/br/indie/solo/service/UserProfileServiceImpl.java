package br.indie.solo.service;

import br.indie.solo.dao.UserProfileDao;
import br.indie.solo.model.UserProfile;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("userProfileService")
@Transactional
public class UserProfileServiceImpl implements UserProfileService {

    @Autowired
    UserProfileDao dao;

    public List<UserProfile> findAll() {
        return dao.findAll();
    }

    public UserProfile findByType(String type) {
        return dao.findByType(type);
    }

    public UserProfile findById(int id) {
        return dao.findById(id);
    }
}

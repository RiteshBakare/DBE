package com.ritesh.bakare0.Custom.Form.repository;

import com.ritesh.bakare0.Custom.Form.models.Data;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DataRepository  extends JpaRepository<Data,Long> {
}

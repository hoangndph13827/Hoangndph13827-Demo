package java5_Lab5.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import java5_Lab5.entities.Account;

public interface AccountRepositories extends JpaRepository<Account, String> {
	public List<Account> findByActivated(int activated);
	
	public Account findByUsername(String username);
}

package ninja.wordy.blog.model;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.HashSet;
import java.util.Set;

import static javax.persistence.CascadeType.ALL;
import static javax.persistence.FetchType.EAGER;

@Entity
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;

    @NotNull
    @Size(min=3, max=255)
    private String username;

    @NotNull
    @Size(min=3, max=255)
    private String password;

    @NotNull
    @Size(min=3, max=255)
    private String firstName;

    @NotNull
    @Size(min=3, max=255)
    private String lastName;

    @ManyToMany(fetch = EAGER, cascade = ALL)
    @JoinTable(name="user_role", joinColumns = {
            @JoinColumn(name = "user_id", nullable = false)
    }, inverseJoinColumns = {@JoinColumn(name = "role_id", nullable = false)})
    private Set<Role> roles = new HashSet<Role>(0);

    public long getId() {
        return id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public Set<Role> getRoles() {
        return roles;
    }

    public void setRoles(Set<Role> roles) {
        this.roles = roles;
    }
}

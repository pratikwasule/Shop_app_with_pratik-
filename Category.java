package entity;

 import java.util.ArrayList;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Category {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
private int categoryId;
private String categoryTitle;
private String categoryDecription;
@OneToMany(mappedBy = "category")
private List<Product> products=new ArrayList<>();


public Category(int categoryId, String categoryTitle, String categoryDecription, List<Product> products) {
	super();
	this.categoryId = categoryId;
	this.categoryTitle = categoryTitle;
	this.categoryDecription = categoryDecription;
 }
public Category(String categoryTitle, String categoryDecription, List<Product> products) {
	super();
	this.categoryTitle = categoryTitle;
	this.categoryDecription = categoryDecription;
 }
public Category() {
	super();
}
@Override
public String toString() {
	return "Category [categoryId=" + categoryId + ", categoryTitle=" + categoryTitle + ", categoryDecription="
			+ categoryDecription  + "]";
}
public int getCategoryId() {
	return categoryId;
}
public void setCategoryId(int categoryId) {
	this.categoryId = categoryId;
}
public String getCategoryTitle() {
	return categoryTitle;
}
public void setCategoryTitle(String categoryTitle) {
	this.categoryTitle = categoryTitle;
}
public String getCategoryDecription() {
	return categoryDecription;
}
public void setCategoryDecription(String categoryDecription) {
	this.categoryDecription = categoryDecription;
}
 
public List<Product> getProducts() {
	return products;
}
public void setProducts(List<Product> products) {
	this.products = products;
}
  
}

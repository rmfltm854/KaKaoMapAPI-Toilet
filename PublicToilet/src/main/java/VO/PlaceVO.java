package VO;

public class PlaceVO {
	
	private int star;
	private String title;
	private int result;

	public int getStar() {
		return star;
	}

	public void setStar(int star) {
		this.star = star;
	}

	
	

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getResult() {
		return result;
	}

	public void setResult(int result) {
		this.result = result;
	}

	@Override
	public String toString() {
		return "Review [star=" + star + ", title=" + title + "]";
	}
	
	
	
	

}

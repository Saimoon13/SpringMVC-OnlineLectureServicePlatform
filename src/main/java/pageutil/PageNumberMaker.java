package pageutil;

public class PageNumberMaker {

	private PaginationCriteria criteria;

	private int totalCount;
	private int numsOfLinks;

	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	
	public PageNumberMaker() {
		this.numsOfLinks = 10;
	}

	public PaginationCriteria getCriteria() {
		return criteria;
	}

	public void setCriteria(PaginationCriteria criteria) {
		this.criteria = criteria;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getNumsOfLinks() {
		return numsOfLinks;
	}

	public void setNumsOfLinks(int numsOfLinks) {
		this.numsOfLinks = numsOfLinks;
	}

	public int getStartPage() {
		return startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setPageMakerData() {
		int totalPageNum = (int)
				Math.ceil((double) totalCount / criteria.getNumsPerPage());
		
		int temp = (int)
				(Math.ceil((double) criteria.getPage() / numsOfLinks)) * numsOfLinks;
		if (temp > totalPageNum) {
			endPage = totalPageNum;
		} else {
			endPage = temp;
		}
		
		startPage = ((endPage - 1) / numsOfLinks) * numsOfLinks + 1;
		
		if (startPage == 1) {
			prev = false;
		} else {
			prev = true;
		}
		
		if (endPage * criteria.getNumsPerPage() >= totalCount) {
			next = false;
		} else {
			next = true;
		}
	}
	
} // end class PageNumberMaker





















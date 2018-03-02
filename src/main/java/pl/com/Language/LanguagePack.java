package pl.com.Language;

public class LanguagePack {

	public String hello;
	public String select;

	public LanguagePack() {
		setLanguage("pl");
	}
	
	public void setLanguage(String languageIndex) {
		if(languageIndex.endsWith("pl")) {
			
			this.hello = "Witam";
			this.select = "wybierz";
			
		} else if(languageIndex.equals("eng")) {
			
			this.hello = "Welcome";
			this.select = "selecet";
			
		}
	}
	
	public String print() {
		
		return hello;
	}
	
}

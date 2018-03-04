package pl.com.Language;

public class LanguagePack {

	public String hello;
	public String select;
	public String language;

	public LanguagePack() {
		setLanguage("pl");
	}
	
	public void setLanguage(String languageIndex) {
		
		/**POLSKI**/
		if(languageIndex.endsWith("pl")) {
			
			this.hello = "Witam";
			this.select = "wybierz";
			this.language = "język";
			
			
		/**ENGLISH**/	
		} else if(languageIndex.equals("eng")) {
			
			this.hello = "Welcome";
			this.select = "selecet";
			this.language ="language";
			
		}
	}
	
	public String printhello() {
		return hello;
	}
	public String printselect() {
		return select;
	}
	public String printlanguage() {
		return language;
	}
	
}

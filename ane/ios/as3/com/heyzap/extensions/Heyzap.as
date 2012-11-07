package com.heyzap.extensions
{
	import flash.external.ExtensionContext;
	
	public class Heyzap
	{	
		private var exContext : ExtensionContext;
		
		public function Heyzap()
		{
			exContext = ExtensionContext.createExtensionContext("com.heyzap.extension", "heyzap");
		}
		
		public function load(showCheckin : Boolean, appStoreId : String, appUrl : String) : void
		{
			if (exContext != null)
				exContext.call("load", showCheckin, appStoreId, appUrl);
		}
		
		public function checkin(text : String) : void
		{
			if (exContext != null)
				exContext.call("checkin", text);
		}
		
		public function submitScore(score : String, displayScore : String, levelId : String) : void
		{
			trace("Heyzap: submitScore not supported");
		}
		
		public function showLeaderboards() : void
		{
			trace("Heyzap: showLeaderboards not supported");
		}

		public function isSupported() : Boolean
		{
			return exContext != null && exContext.call("isSupported");
		}
	}
}

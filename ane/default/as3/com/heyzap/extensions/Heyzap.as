package com.heyzap.extensions
{
	import flash.external.ExtensionContext;
	
	public class Heyzap
	{	
		private var exContext : ExtensionContext;
		
		public function Heyzap()
		{
		}
		
		public function load(showCheckin : Boolean, appStoreId : String, appUrl : String) : void
		{
			trace("Heyzap: load called");
		}
		
		public function checkin(text : String) : void
		{
			trace("Heyzap: checkin called");
		}

		public function submitScore(score : String, displayScore : String, levelId : String) : void
		{
			trace("Heyzap: submitScore called");
		}
		
		public function showLeaderboards() : void
		{
			trace("Heyzap: showLeaderboards called");
		}

		public function isSupported() : Boolean
		{
			trace("Heyzap: isSupported called");
			return false;
		}
	}
}

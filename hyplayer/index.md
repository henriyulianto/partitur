---
layout: hyplayer
---

  <!-- Fixed header with BWV navigation and audio controls -->
  <div id="header-wrapper" class="fixed-top bg-light">
    <!-- BWV Navigation Bar -->

    <!-- Header with title and audio controls -->
    <div id="header" class="py-2 container text-center" style="background-color: transparent;">
      <!-- <div id="bwv-navigation" class="py-2" style="background-color: transparent;">
        <div id="bwv-buttons-container" class="d-flex justify-content-center gap-2" style="min-height: 31px;">
          <div id="bwv-navigation-loading" class="text-muted small">&nbsp;</div>
        </div>
      </div> -->
      <div class="d-flex align-items-center justify-content-center position-relative gap-2" style="background-color: transparent;">
        <!-- Main audio player -->
        <audio id="audio" class="flex-grow-1 my-1" style="max-width: 52rem; max-height: 2rem;" controls>
          <source id="audio-source" src="" type="audio/wav">
          Your browser does not support the audio element.
        </audio>
        <!-- Bar spy - positioned dynamically by JavaScript -->
        <div id="bar_spy" class="badge rounded-pill text-bg-secondary d-flex align-items-center gap-1"
          style="visibility: hidden;">
          <span id="current_bar">1</span>
          <span>of</span>
          <span id="total_bars">--</span>
        </div>
      </div>
    </div>
  </div>

  <!-- Add missing main-content wrapper -->
  <div class="main-content" style="position: relative;">

    <!-- Bootstrap loading animation -->
    <div id="loading"
      style="position: fixed; top: var(--header-height); left: 0; right: 0; bottom: 0; z-index: 1000; background-color: white; margin: 0; padding: 0;"
      class="d-flex align-items-center justify-content-center">
      <div class="text-center">
        <div class="spinner-border text-primary mb-3" style="width: 4rem; height: 4rem; color: #8B4513 !important;"
          role="status">
          <span class="visually-hidden">Loading...</span>
        </div>
        <div class="text-muted"><!--Loading --><span id="loading-werk"></span></div>
      </div>
    </div>

    <!-- Main content area for musical notation -->
    <div class="container" style="background-color: transparent;">

      <!-- Updated measure controls with fixed dropdown styling -->
      <div id="measure-controls" style="display: none;">
        <label for="highlight-select">Measure Highlighting:</label>
        <select id="highlight-select" class="form-select form-select-sm">
          <option value="">None</option>
        </select>
        <small id="highlight-info" class="text-muted ms-2" style="display: none;"></small>
      </div>

      <div id="svg-container"></div>

    </div>

  </div> <!-- End main-content wrapper -->

  <!-- Scroll-to-top button - positioned dynamically by JavaScript, auto-hides when not needed -->
  <a id="button_scroll_to_top" type="button"
    class="btn btn-outline-light btn-sm d-inline-flex align-items-center justify-content-center position-fixed"
    style="bottom: 40px; right: 0; visibility: hidden; width: 28px; height: 28px; border: 1px solid var(--bach-taupe-50); z-index: 1040; background-color: var(--bach-cream);"
    title="scroll_to_top"
    onclick="document.getElementById('svg-container').scrollIntoView({ behavior: 'smooth', block: 'start'}); return false;">
    <img src="{{ site.url }}{{ site.baseurl }}/assets/images/up-arrow-svgrepo-com.svg" width="16" height="16" alt="scroll_up"
      style="filter: brightness(0) saturate(100%) invert(50%) sepia(5%) saturate(388%) hue-rotate(314deg) brightness(89%) contrast(87%);">
  </a>

  <script type="module" src="{{ site.url }}{{ site.baseurl }}/assets/js/hyplayer.js"></script>

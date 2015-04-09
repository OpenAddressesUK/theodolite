---
title: Address Location
---

Find out where addresses are located by looking up the latitude and longitude for the address’s postcode.

This service is in **Alpha**.

##### Demonstration

<script>
  function filterSearch(){
    // cribbed off stackoverflow like a boss: https://stackoverflow.com/questions/2417928/delete-empty-values-from-forms-params-before-submitting-it
    form = jQuery("#search");
    form.find(':input', this).each(function() {
        this.disabled = !($(this).val());
    });
  }

  // Make sure form elements are enabled (needed for Firefox)
  form = jQuery("#search");
  form.find(':input', this).each(function() {
    this.disabled = false;
  });
</script>

<form action="/addresses" class="address-search" role="form" id="search" onSubmit="filterSearch(); return true" >

  <label class="sr-only" for="street">Street name</label>
  <input type="text" class="form-control" id="street" name="street" placeholder="Street name" value="<%= params[:street]%>">

  <label class="sr-only" for="town">Town or City</label>
  <input type="text" class="form-control" id="town" name="town" placeholder="Town or City" value="<%= params[:town]%>">

  <label class="sr-only" for="postcode">Postcode</label>
  <input type="text" class="form-control" id="postcode" name="postcode" placeholder="Postcode" value="<%= params[:postcode]%>">

  <button type="submit" class="btn btn-primary">Search</button>

</form>

<% if @addresses %>

  <% if @addresses.count == 0 %>

    <div class="alert alert-warning" role="alert">
      <p>Sorry, there were no results for your query.</p>
    </div>

  <% else %>

    <h2 class="address-search-results-title">Results</h2>
    <%= alternate_link_buttons(class: 'address-search-alt-button') %>

    <hr>

    <div id="map" class="address-search-results-map"><%= image_tag 'fake-map.png' %></div><!-- FAKE MAP NEEDS REPLACING BEFORE LAUNCH -->

    <ul class="address-search-results-list">
    <% @addresses.each do |address| %>

      <li data-latlng="<%= address.postcode.lat_lng.to_a.join(",") %>"><%= link_to address.full_address, address %></li>

    <% end %>
    </ul>

    <%= paginate @addresses %>

  <% end %>

  <hr>

  <%= render 'addresses/address_submit' %>

<% end %>

Locating an address may sound simple but it can be surprisingly hard. Open Addresses makes it easy. The location of an address can be used to plan delivery routes, determine geographic distance from physical services (“how many addresses are within 1000m of this pharmacy?”, “where is the nearest drug advice centre?”) or be displayed on maps to support data visualisations.

In the future we plan to expand this service to capture and publish the latitude and longitude for individual addresses followed by support for capturing the height, or altitude, of addresses. These extensions will provide even greater benefits to service providers and users. Knowing that an address is on the 10th floor can help everyone from a delivery firm to someone looking for a new home make more informed decisions.

##### Implementation

To implement this service you simply use our [search API](/developers/search). The API returns the latitude and longitude for the centre of the postcode along with every known address.

If you want our help in implementing the service, want to share your ideas or want to ask the community a question then we would suggest either using the [forums](https://github.com/OpenAddressesUK/forum) or dropping us an email to [info@openaddressesuk.org](mailto:info@openaddressesuk.org).
